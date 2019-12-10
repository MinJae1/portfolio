package com.manage.bikok.info.member.dao;

import com.manage.bikok.info.member.model.MemberVO;

public interface IMemberDao {
	void addManage(MemberVO member);

	MemberVO login(MemberVO member);
	
	int idCheck(String userId);
	
	String pwdCheck(String userId);
}
