package com.manage.bikok.info.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.manage.bikok.info.member.dao.IMemberDao;
import com.manage.bikok.info.member.model.MemberVO;

@Service
public class MemService implements IMemService {

	@Inject
	IMemberDao manageDao;

	@Override
	public MemberVO login(MemberVO member) {
		// TODO Auto-generated method stub
		return manageDao.login(member);
	}

	@Override
	public void addManage(MemberVO member) {
		// TODO Auto-generated method stub
		manageDao.addManage(member);
	}

	@Override
	public int idCheck(String userId) {
		// TODO Auto-generated method stub
		return manageDao.idCheck(userId);
	}

	@Override
	public String pwdCheck(String userId) {
		// TODO Auto-generated method stub
		return manageDao.pwdCheck(userId);
	}

}
