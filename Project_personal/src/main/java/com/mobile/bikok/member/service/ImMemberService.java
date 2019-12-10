package com.mobile.bikok.member.service;

import com.mobile.bikok.member.model.MMemberVO;

public interface ImMemberService {
	void joinMember(MMemberVO mMemberVO);

	MMemberVO mobileLogin(MMemberVO mMemberVO);

	int idCheck(String memberId);

	String pwdCheck(String memberId);
}
