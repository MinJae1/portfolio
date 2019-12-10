package com.manage.bikok.info.member.service;

import com.manage.bikok.info.member.model.MemberVO;

public interface IMemService {

	MemberVO login(MemberVO member);

	void addManage(MemberVO member);
	
	int idCheck(String userId);

	String pwdCheck(String userId);

}
