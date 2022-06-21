package com.ruby.devel.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@GetMapping("/signup")  // 회원가입 페이지
	public String member_signup()
	{
		return "/member/member_addForm";  // m/member/(파일명)
	}
	
	@GetMapping("/signupinfo")  // 회원가입 추가정보 페이지
	public String member_signupinfo()
	{
		return "/member/member_infoAddForm";
	}
	
	@GetMapping("/findaccount")  // 계정 정보 찾기 페이지
	public String member_findaccount()
	{
		return "/member/member_accountFindForm";
	}
	
	@GetMapping("/login")  // 로그인 페이지
	public String member_login()
	{
		return "/member/member_loginForm";
	}
	
	@GetMapping("/findidresult")  // 아이디 찾기 결과 페이지
	public String member_findidresult()
	{
		return "/member/member_findIdResult";
	}
	
	@GetMapping("/pwreset")  // 비밀번호 재설정 페이지
	public String member_userpwreset()
	{
		return "/member/member_userPwReset";
	}
}
