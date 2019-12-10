package com.manage.bikok.board.notice.dao;

import java.util.ArrayList;

import com.manage.bikok.board.notice.model.NoticeVO;

public interface INoticeDao {
	ArrayList<NoticeVO> getNoticeList();

	void addNotice(NoticeVO noticeVO);
	
	NoticeVO noticeDetail(NoticeVO noticeVO);

	void modifyNotice(NoticeVO noticeVO);

	void deleteNotice(NoticeVO noticeVO);

}
