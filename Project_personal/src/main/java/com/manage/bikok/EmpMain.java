package com.manage.bikok;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.manage.bikok.info.member.service.IMemService;

public class EmpMain {
	public static void main(String[] args) {
		AbstractApplicationContext context = new GenericXmlApplicationContext("spring/application-config.xml");
	}
}