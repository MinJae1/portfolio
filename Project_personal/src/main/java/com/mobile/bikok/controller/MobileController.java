package com.mobile.bikok.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.mobile.device.site.SitePreferenceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manage.bikok.info.bike.model.BikeVO;
import com.manage.bikok.info.bike.service.IBikeService;
import com.mobile.bikok.member.model.MMemberVO;
import com.mobile.bikok.member.service.ImMemberService;
import com.mobile.bikok.rent.model.MRentVO;
import com.mobile.bikok.rent.service.ImRentService;

@Controller
public class MobileController {

	@Autowired
	ImMemberService mMemberService;

	@Autowired
	ImRentService mRentService;

	@Autowired
	IBikeService bikeService;

	/* 모바일 */
//	load
	@RequestMapping(value = "/mobile", method = RequestMethod.GET)
	public String MobileLoad(Device device, HttpServletRequest req) throws Exception {
		System.out.println("mobile_load");

		if (device.isMobile()) {
			System.out.println("Hello mobile user!");
		} else if (device.isTablet()) {
			System.out.println("Hello tablet user!");
		} else {
			System.out.println("Hello desktop user!");
		}

		return "mobile/m_main";
	}

	// back
	@RequestMapping(value = "/back", method = RequestMethod.GET)
	public String Back(HttpServletRequest req) throws Exception {
		System.out.println("back_home");

		HttpSession session = req.getSession();

		session.setAttribute("user", session.getAttribute("user"));

		return "redirect:/mobile";
	}

	// login
	@RequestMapping(value = "/m_login", method = RequestMethod.POST)
	public String MobileLogin(MMemberVO mMemberVO, HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		System.out.println("mobile_login");
		BCrypt bCrypt = new BCrypt();

		HttpSession session = req.getSession();

		String pwd_chk = mMemberService.pwdCheck(mMemberVO.getMemberId());

		if (mMemberVO.getMemberId() != "" && mMemberVO.getPwd() != "") {
			if (BCrypt.checkpw(mMemberVO.getPwd(), pwd_chk)) {
				mMemberVO.setPwd(pwd_chk);
				System.out.println("login :" + mMemberVO.toString());

				MMemberVO login = mMemberService.mobileLogin(mMemberVO);
				System.out.println("Login Success");
				session.setAttribute("user", login);
				return "redirect:/mobile";
			} else {
				session.setAttribute("user", null);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.');</script>");
				out.flush();
				return "mobile/m_main";
			}

		} else {
			return "redirect:/m_main";
		}

	}

	@RequestMapping(value = "/m_logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/m_main";
	}

	// join
	@RequestMapping(value = "/m_join", method = RequestMethod.GET)
	public String MobileJoin() throws Exception {
		System.out.println("mobile_join_page");
		return "mobile/m_join";
	}

	// join_insert
	@RequestMapping(value = "/m_join_insert", method = RequestMethod.POST)
	public String MobileJoinInsert(MMemberVO mMemberVO, HttpServletResponse response, Model model) throws Exception {
		System.out.println("mobile_join_insert");
		System.out.println(mMemberVO);

		BCrypt bCrypt = new BCrypt();

		int chk_val = mMemberService.idCheck(mMemberVO.getMemberId());

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (chk_val == 0) {
			mMemberVO.setPwd(BCrypt.hashpw(mMemberVO.getPwd(), BCrypt.gensalt(10)));
			mMemberService.joinMember(mMemberVO);

			out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
			out.flush();

			return "redirect:/mobile";

		} else {
			System.out.println("error : Same ID");
			model.addAttribute("msg", "동일한 아이디가 존재합니다.");
			return "/msg";
		}

	}

// home
	@RequestMapping(value = "/m_main", method = RequestMethod.GET)
	public String MobileHome(HttpServletRequest req) throws Exception {
		System.out.println("mobile_main");
		HttpSession session = req.getSession();

		if (session.getAttribute("user") != null) {
			session.setAttribute("user", session.getAttribute("user"));

		} else {
			session.setAttribute("user", null);

		}

		return "mobile/m_main";
	}

	// rent
	@RequestMapping(value = "/rent_page", method = RequestMethod.GET)
	public String RentPage(HttpServletRequest req, Model model) throws Exception {
		System.out.println("rent_page");
		HttpSession session = req.getSession();

		if (session.getAttribute("user") != null) {
			session.setAttribute("user", session.getAttribute("user"));
			ArrayList<BikeVO> bikeList = bikeService.bikeList();

			req.setAttribute("bikeList", bikeList);
			return "mobile/rent/m_rent";

		} else {
			System.out.println("error : be not login");
			model.addAttribute("msg", "로그인을 해주세요.");
			return "/msg";
		}

	}

	// rent
	@ResponseBody
	@RequestMapping(value = "/rent_now", method = RequestMethod.POST)
	public void Rent(@RequestBody MRentVO mRentVO) throws Exception {
		System.out.println(mRentVO);
		mRentService.RentBike(mRentVO);
	}

	// realTime update 5s
	@ResponseBody
	@RequestMapping(value = "/runningtime", method = RequestMethod.POST)
	public void RealTimeUpdate(@RequestBody MRentVO mRentVO) throws Exception {
		System.out.println("running Time");
		System.out.println(mRentVO);

		int getno = mRentService.getNo(mRentVO);

		mRentVO.setNo(getno);

		mRentService.runningTimeUpdate(mRentVO);
	}

	// return
	@ResponseBody
	@RequestMapping(value = "/return", method = RequestMethod.POST)
	public void Retuen(@RequestBody MRentVO mRentVO, HttpServletRequest req) throws Exception {
		System.out.println(mRentVO);

		int getno = mRentService.getNo(mRentVO);

		mRentVO.setNo(getno);

		mRentService.ReturnBike(mRentVO);
	}

	// mypage
	@RequestMapping(value = "/m_mypage", method = RequestMethod.GET)
	public String MobileMypage(HttpServletRequest req, Model model) throws Exception {
		System.out.println("mobile_mypage");
		HttpSession session = req.getSession();

		if (session.getAttribute("user") != null) {
			session.setAttribute("user", session.getAttribute("user"));
			return "mobile/mypage/m_mypage";

		} else {
			System.out.println("error : be not login");
			model.addAttribute("msg", "로그인을 해주세요.");
			return "/msg";
		}

	}

	// checkpage
	@RequestMapping(value = "/check_page", method = RequestMethod.GET)
	public String MobileCheckpage(HttpServletRequest req) throws Exception {
		System.out.println("mobile_check_page");
		HttpSession session = req.getSession();

		session.setAttribute("user", session.getAttribute("user"));

		return "mobile/check/m_check";
	}

}
