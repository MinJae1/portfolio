package com.manage.bikok.board.notice.service;

import java.util.ArrayList;

import com.manage.bikok.board.notice.model.NoticeVO;

public interface INoticeService {
		
	ArrayList<NoticeVO> getNoticeList();

	void addNotice(NoticeVO noticeVO);
	
	NoticeVO noticeDetail(NoticeVO noticeVO);

	void modifyNotice(NoticeVO noticeVO);

	void deleteNotice(NoticeVO noticeVO);

}
