package com.mobile.bikok.member.dao;

import com.mobile.bikok.member.model.MMemberVO;

public interface ImMemberDao {
	void joinMember(MMemberVO mMemberVO);

	MMemberVO mobileLogin(MMemberVO mMemberVO);

	int idCheck(String memberId);

	String pwdCheck(String memberId);
}
