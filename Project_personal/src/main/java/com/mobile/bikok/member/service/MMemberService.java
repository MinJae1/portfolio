package com.mobile.bikok.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mobile.bikok.member.dao.ImMemberDao;
import com.mobile.bikok.member.model.MMemberVO;

@Service
public class MMemberService implements ImMemberService {

	@Inject
	ImMemberDao mMemberDao;

	@Override
	public void joinMember(MMemberVO mMemberVO) {
		// TODO Auto-generated method stub
		mMemberDao.joinMember(mMemberVO);
	}

	@Override
	public MMemberVO mobileLogin(MMemberVO mMemberVO) {
		// TODO Auto-generated method stub
		return mMemberDao.mobileLogin(mMemberVO);
	}

	@Override
	public int idCheck(String memberId) {
		// TODO Auto-generated method stub
		return mMemberDao.idCheck(memberId);
	}

	@Override
	public String pwdCheck(String memberId) {
		// TODO Auto-generated method stub
		return mMemberDao.pwdCheck(memberId);
	}

}
