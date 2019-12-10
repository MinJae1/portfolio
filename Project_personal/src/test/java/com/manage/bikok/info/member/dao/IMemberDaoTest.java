package com.manage.bikok.info.member.dao;

import static org.junit.Assert.*;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;

import com.manage.bikok.board.notice.model.NoticeVO;
import com.manage.bikok.info.member.model.MemberVO;

public class IMemberDaoTest {

	IMemberDao memDao = mock(IMemberDao.class);

	MemberVO memberVO = mock(MemberVO.class);

	@Before
	public void set() {
		memberVO.setUserId("junit");
		memberVO.setPwd("test");
	}

	@Test
	public void joinTest() throws Exception {
		doNothing().when(memDao).addManage(memberVO);
	}

	@Test
	public void loginTest() throws Exception {
		when(memDao.login(memberVO)).thenReturn(memberVO);
	}

}
