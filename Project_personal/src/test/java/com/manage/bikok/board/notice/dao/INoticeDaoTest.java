package com.manage.bikok.board.notice.dao;

import static org.junit.Assert.*;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.ArrayList;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.manage.bikok.board.notice.model.NoticeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/resources/spring/*.xml" })

public class INoticeDaoTest {
	
	INoticeDao noticedao = mock(INoticeDao.class);

	NoticeVO noticeVO = mock(NoticeVO.class);

	@Before
	public void set() {
		noticeVO.setTitle("junit test");
		noticeVO.setContent("junit test cointent");
		noticeVO.setUserId(1);
		noticeVO.setInsertDate("20191107");
		noticeVO.setModifyDate("20191107");
	}

	@Test
	public void insertTest() throws Exception {

		System.out.println(noticeVO);
		
		when(noticedao.getNoticeList()).thenReturn( new ArrayList<NoticeVO>());
		
		doNothing().when(noticedao).addNotice(noticeVO);

//		int sizeBefore = noticedao.getNoticeList().size();
//		System.out.println(sizeBefore);
//
//		noticedao.addNotice(noticeVO);
//
//		int sizeAfter = noticedao.getNoticeList().size();
//		System.out.println(sizeAfter);
//
//		assertEquals(sizeBefore + 1, sizeAfter);

	}
}
