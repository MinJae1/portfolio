package com.manage.bikok.board.notice.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.manage.bikok.board.notice.dao.INoticeDao;
import com.manage.bikok.board.notice.model.NoticeVO;

@Service
public class NoticeService implements INoticeService {

	@Inject
	INoticeDao noticeDao;

	@Override
	public ArrayList<NoticeVO> getNoticeList() {
		// TODO Auto-generated method stub
		return noticeDao.getNoticeList();
	}

	@Override
	public void addNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeDao.addNotice(noticeVO);
	}

	@Override
	public NoticeVO noticeDetail(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		return noticeDao.noticeDetail(noticeVO);
	}

	@Override
	public void modifyNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeDao.modifyNotice(noticeVO);
	}

	@Override
	public void deleteNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeDao.deleteNotice(noticeVO);
	}

}
