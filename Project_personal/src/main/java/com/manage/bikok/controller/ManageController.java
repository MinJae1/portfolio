package com.manage.bikok.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.apache.ibatis.annotations.Param;
import org.mindrot.jbcrypt.BCrypt;

import com.manage.bikok.board.notice.model.NoticeVO;
import com.manage.bikok.board.notice.service.INoticeService;
import com.manage.bikok.info.bike.model.BikeVO;
import com.manage.bikok.info.bike.service.IBikeService;
import com.manage.bikok.info.fence.model.FenceVO;
import com.manage.bikok.info.fence.service.IFenceService;
import com.manage.bikok.info.member.model.MemberVO;
import com.manage.bikok.info.member.service.IMemService;
import com.manage.bikok.rent.realT.model.RealTimerVO;
import com.manage.bikok.rent.realT.service.IRealTimeService;
import com.mobile.bikok.rent.model.MRentVO;
import com.mobile.bikok.rent.service.ImRentService;

@Controller
public class ManageController {

	@Autowired
	IMemService memService;

	@Autowired
	INoticeService noticeService;

	@Autowired
	IRealTimeService realTimeService;

	@Autowired
	IFenceService fenceService;

	@Autowired
	IBikeService bikeService;

	@Autowired
	ImRentService rentService;

	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat wformat = new SimpleDateFormat("yyyy-MM-dd");

//	회원가입
	@RequestMapping(value = "/joinpage", method = RequestMethod.GET)
	public String joinpage() {
		return "join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String insertManage(MemberVO memVo, HttpServletResponse response, Model model) throws IOException {

		BCrypt bCrypt = new BCrypt();

		int chk_val = memService.idCheck(memVo.getUserId());

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (chk_val == 0) {
			memVo.setPwd(BCrypt.hashpw(memVo.getPwd(), BCrypt.gensalt(10)));
			memService.addManage(memVo);
			System.out.println(memVo.toString());

			out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
			out.flush();

			return "login";

		} else {
			System.out.println("Same ID");
			model.addAttribute("msg", "동일한 아이디가 존재합니다.");
			return "msg";

		}

	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO memVo, HttpServletRequest req, HttpServletResponse response) throws Exception {

		BCrypt bCrypt = new BCrypt();

		HttpSession session = req.getSession();

		String pwd_chk = memService.pwdCheck(memVo.getUserId());

		if (memVo.getUserId() != "" && memVo.getPwd() != "") {
			if (BCrypt.checkpw(memVo.getPwd(), pwd_chk)) {
				memVo.setPwd(pwd_chk);
				System.out.println(memVo.toString());

				MemberVO login = memService.login(memVo);
				System.out.println("Login Success");
				session.setAttribute("member", login);
				return "main";
			} else {
				session.setAttribute("member", null);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.');</script>");
				out.flush();
				return "login";
			}

		} else {
			return "redirect:/";
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

//	홈
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String Home() throws Exception {
		return "index";
	}

	@RequestMapping(value = "/chargeMng", method = RequestMethod.GET)
	public String Charge(HttpServletRequest req) {
		req.setAttribute("chargeList", null);
		return "info/charge_list";
	}

//	공지사항

	@RequestMapping(value = "/noticeMng", method = RequestMethod.GET)
	public String Notice(HttpServletRequest req) {
		ArrayList<NoticeVO> notlist = noticeService.getNoticeList();

		req.setAttribute("notlist", notlist);
		return "board/notice_list";
	}

	@RequestMapping(value = "/newNotice", method = RequestMethod.GET)
	public String addNoticepage(HttpServletRequest req) {
		return "board/notice_insert";
	}

	@RequestMapping(value = "/addNotice", method = RequestMethod.POST)
	public String addNotice(NoticeVO noticeVO, HttpServletRequest req) {

		Date date = new Date();

		noticeVO.setInsertDate(format.format(date));
		noticeVO.setModifyDate(format.format(date));

		noticeVO.toString();
		noticeService.addNotice(noticeVO);
		return "redirect:/noticeMng";
	}

	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@RequestParam("no") int no, NoticeVO noticeVO, HttpServletRequest req) {

		noticeVO.setNo(no);

		NoticeVO detail = noticeService.noticeDetail(noticeVO);
		System.out.println(detail);
		req.setAttribute("notice", detail);

		return "board/notice_view";
	}

	@RequestMapping(value = "/modifyNoticePage", method = RequestMethod.GET)
	public String modifyNotice(@RequestParam("no") int no, NoticeVO noticeVO, HttpServletRequest req) {
		noticeVO.setNo(no);

		NoticeVO mod = noticeService.noticeDetail(noticeVO);
		req.setAttribute("notice", mod);

		return "board/notice_modify";
	}

	@RequestMapping(value = "/modifyNotice", method = RequestMethod.POST)
	public String modifyNotice(NoticeVO noticeVO, HttpServletRequest req) {
		Date date = new Date();
		noticeVO.setModifyDate(format.format(date));

		noticeVO.toString();

		noticeService.modifyNotice(noticeVO);

		return "redirect:/noticeMng";
	}

	@RequestMapping(value = "/noticeDelete", method = RequestMethod.GET)
	public String deleteNotice(@RequestParam("no") int no, NoticeVO noticeVO, HttpServletRequest req) {
		noticeVO.setNo(no);

		noticeService.deleteNotice(noticeVO);

		return "redirect:/noticeMng";
	}

//	실시간이용
	@RequestMapping(value = "/realTMng", method = RequestMethod.GET)
	public String realTime(HttpServletRequest req) {

		ArrayList<RealTimerVO> usingList = realTimeService.usingTimeList();

		req.setAttribute("usingList", usingList);
		return "rent/realT_list";
	}

//	실시간이용
	@RequestMapping(value = "/position_popup", method = RequestMethod.GET)
	public String realPosition(@RequestParam("no") String no, @RequestParam("id") int id,
			@RequestParam("realT") String realT, MRentVO mRentVO, HttpServletRequest req) {
		mRentVO.setBike_id(no);
		mRentVO.setMember_no(id);
		mRentVO.setReal_time(realT);

		MRentVO position = rentService.getPosition(mRentVO);

		req.setAttribute("position", position);

		return "rent/popup/bike_position";
	}

	/*
	 * @RequestMapping(value = "/pop_real", method = RequestMethod.GET) public
	 * String realPop(HttpServletRequest req) {
	 * 
	 * return "rent/real_popup"; }
	 * 
	 * @RequestMapping(value = "/pop_cnt_start", method = RequestMethod.GET) public
	 * String cntStart(RealTimerVO RTVO, HttpServletRequest req) {
	 * 
	 * RTVO.setCode("bik_12_V5_24"); RTVO.setState(1); RTVO.setTime("00:00");
	 * RTVO.setUserId(1);
	 * 
	 * realTimeService.timerStart(RTVO);
	 * 
	 * return "redirect:/realTMng";
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/pop_cnt_stop", method = RequestMethod.POST) public
	 * String cntStop(RealTimerVO RTVO, HttpServletRequest req, HttpServletResponse
	 * response) {
	 * 
	 * String[] timearray = RTVO.getTime().split(",");
	 * 
	 * RealTimerVO getNo = realTimeService.getNo(); RTVO.setNo(getNo.getNo());
	 * 
	 * RTVO.setTime(timearray[0]);
	 * 
	 * RTVO.setState(0);
	 * 
	 * realTimeService.timerStop(RTVO);
	 * 
	 * return "redirect:/realTMng";
	 * 
	 * }
	 */

//	전자울타리관리
	@RequestMapping(value = "/fenceList", method = RequestMethod.GET)
	public String fenceManage(HttpServletRequest req) {

		ArrayList<FenceVO> fenceList = fenceService.fenceList();

		req.setAttribute("fenceList", fenceList);
		return "info/fence/fence_list";
	}

	@RequestMapping(value = "/fenceAddPage", method = RequestMethod.GET)
	public String fenceAddPage(HttpServletRequest req) {
		Date date = new Date();
		String wdate = wformat.format(date);

		req.setAttribute("wdate", wdate);

		return "info/fence/fence_add";
	}

	@RequestMapping(value = "/newFence", method = RequestMethod.POST)
	public String fenceAdd(HttpServletRequest req, FenceVO fenceVO) {

		System.out.println(fenceVO);

		Date date = new Date();
		String wdate = format.format(date);

		fenceVO.setwDate(wdate);

		fenceService.addFence(fenceVO);

		return "redirect:/fenceList";
	}

//	전자울타리상세
	@RequestMapping(value = "/fenceDetail", method = RequestMethod.GET)
	public String fenceDetail(@RequestParam("no") int no, FenceVO fenceVO, HttpServletRequest req) {
		fenceVO.setNo(no);

		FenceVO Fdetail = fenceService.getFence(fenceVO);

		String[] latV = Fdetail.getLatitude().split(",");
		String[] lonV = Fdetail.getLogitude().split(",");

		String latlon = "";

		for (int i = 0; i < lonV.length; i++) {
			latlon += latV[i] + " / " + lonV[i];
			latlon += ",";
		}

		req.setAttribute("detail", Fdetail);

		req.setAttribute("coordinate", latlon);

		return "info/fence/fance_detail";
	}

//	전자울타리수정페이지
	@RequestMapping(value = "/fenceModPage", method = RequestMethod.GET)
	public String fenceModPage(@RequestParam("no") int no, FenceVO fenceVO, HttpServletRequest req) {
		fenceVO.setNo(no);

		FenceVO Fdetail = fenceService.getFence(fenceVO);

		req.setAttribute("detail", Fdetail);

		return "info/fence/fence_modify";
	}

	// 수정
	@RequestMapping(value = "/modFence", method = RequestMethod.POST)
	public String fenceMod(HttpServletRequest req, FenceVO fenceVO) {

		System.out.println(fenceVO);

		fenceService.modifyFence(fenceVO);

		return "redirect:/fenceList";
	}

//	전자울타리popup
	@RequestMapping(value = "/popup_fance", method = RequestMethod.GET)
	public String fencePopup(@RequestParam("no") int no, FenceVO fenceVO, HttpServletRequest req) {
		fenceVO.setNo(no);

		FenceVO Fdetail = fenceService.getFence(fenceVO);

		req.setAttribute("detail", Fdetail);

		return "info/fence/popup/fance_position";
	}

//	자전거 관리
	@RequestMapping(value = "/bikeList", method = RequestMethod.GET)
	public String bikeManage(HttpServletRequest req) {

		ArrayList<BikeVO> bikeList = bikeService.bikeList();

		req.setAttribute("bikeList", bikeList);

		return "info/bike/bike_list";
	}

//	자전거 추가페이지
	@RequestMapping(value = "/bikeAddPage", method = RequestMethod.GET)
	public String bikeAddPage(HttpServletRequest req) {

		return "info/bike/bike_add";
	}

//	자전거 추가
	@RequestMapping(value = "/addBike", method = RequestMethod.POST)
	public String addBike(HttpServletRequest req, BikeVO bike) {

		bikeService.newBike(bike);

		return "redirect:/bikeList";
	}

//	자전거 수정페이지
	@RequestMapping(value = "/bikeModifyPage", method = RequestMethod.GET)
	public String modBikPage(@RequestParam("no") int no, HttpServletRequest req, BikeVO bike) {

		bike.setNo(no);

		BikeVO bikeinfo = bikeService.bikeInfo(bike);

		req.setAttribute("bikeinfo", bikeinfo);

		return "info/bike/bike_modify";
	}

//	자전거 수정
	@RequestMapping(value = "/modBike", method = RequestMethod.POST)
	public String modBike(HttpServletRequest req, BikeVO bike) {

		System.out.println(bike);

		bikeService.modBike(bike);

		return "redirect:/bikeList";
	}

}
