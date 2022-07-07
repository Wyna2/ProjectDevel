package com.ruby.devel.web;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ruby.devel.model.MemberDto;
import com.ruby.devel.service.impl.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	MemberMapper Mmapper;
	
	/* 회원가입 페이지 */
	@GetMapping("/signup")  
	public String member_signup(HttpSession session) {
		String loginOK=(String)session.getAttribute("loginOK");
		
		if(loginOK==null) {	// 로그아웃 상태에서 접근(평시)
			return "/member/member_addForm";
		} else {	// 로그인 상태에서 접근
			session.removeAttribute("loginOK");
			System.out.println("MESSAGE: 로그아웃(force)이 성공적으로 수행되었습니다.");	// 강제 로그아웃
			return "/member/member_addForm";	// member/(파일명)
		}
	}
	
	/* 회원가입 처리 */
	@PostMapping("/memberadd")
	public String memberadd(Model model,
			@ModelAttribute MemberDto m_dto,
			@RequestParam String addr1,
			@RequestParam String addr2,
			@RequestParam String zipcode,
			RedirectAttributes redirectAttributes) {
		// 주소 및 우편번호 병합저장
		m_dto.setAddress(addr1+" "+addr2+" ("+zipcode+")");
		Mmapper.addMember(m_dto);
		
		System.out.println("발급된 member_idx: "+m_dto.getMember_idx());
		// 1회만 전송
		redirectAttributes.addFlashAttribute("member_idx",m_dto.getMember_idx());
		
		return "redirect:addinfo";
	}
	
	/* 추가정보 입력 */
	@GetMapping("/addinfo")  
	public String addmemberinfo() {
		return "/member/member_infoAddForm";
	}
	
	/* id 검증(중복확인) */
	@ResponseBody
	@GetMapping("/idcheck")
	public Map<String, Integer> idCheckProcess(@RequestParam String id) {
		Map<String, Integer> map=new HashMap<>();
		int check=Mmapper.checkVaildId(id);
		map.put("vaildId", check);
	
		return map;
	}
	
	/* nickname 검증(중복확인) */
	@ResponseBody
	@GetMapping("/nicknamecheck")
	public Map<String, Integer> nicknameCheckProcess(@RequestParam String nickname) {
		Map<String, Integer> map=new HashMap<>();
		int check=Mmapper.checkVaildNickname(nickname);
		map.put("vaildNickname", check);
		
		return map;
	}
	/* nickname 검증_마이페이지(중복확인) */
	@ResponseBody
	@GetMapping("activity/nicknamecheck")
	public Map<String, Integer> nicknameCheckProcessMyinfo(@RequestParam String nickname) {
		Map<String, Integer> map=new HashMap<>();
		int check=Mmapper.checkVaildNickname(nickname);
		map.put("vaildNickname", check);
		
		return map;
	}
	
	/* 회원가입 추가정보 */
	@PostMapping("/memberinfoadd") 
	public String memberinfoadd(
			@ModelAttribute MemberDto m_dto,
			@RequestParam String member_idx,
			@RequestParam String job,
			@RequestParam String age,
			@RequestParam String hobby1,
			@RequestParam (required=false, defaultValue="") String hobby2,
			@RequestParam (required=false, defaultValue="") String hobby3,
			@RequestParam String pr,
			@RequestParam (required=false, defaultValue="http://") String link
			) {
		Mmapper.addMemberInfo(m_dto);
		Mmapper.signupComplete(member_idx);
		
		return "/member/member_signupComplete";
	}
	
	/* 로그인 페이지 */
	@GetMapping("/login")  
	public String member_login(HttpSession session,
			Model model) {
		String userID=(String)session.getAttribute("userID");
		String loginOK=(String)session.getAttribute("loginOK");
		String loginTime=(String)session.getAttribute("loginTime");
		
		// 세션 중복 방지
		if(loginOK==null) {	// 로그아웃 상태에서 접근(평시)
			return "/member/member_loginForm";
		} else {	// 로그인 상태에서 접근
			String nickname=Mmapper.getNickname(userID);
			model.addAttribute("nickname", nickname);
			model.addAttribute("loginTime", loginTime);
			return "/member/member_logoutConfirm";
		}
	}
	
	/* 로그인 처리 */
	@PostMapping("/loginprocess")
	public String loginProc(@RequestParam(required=false) String saveid,
			@RequestParam String id,
			@RequestParam String password,
			HttpSession session,
			RedirectAttributes redirectAttributes) {
		HashMap<String, String> user=new HashMap<>();
		user.put("id", id);
		user.put("password", password);
		
		int check_login=Mmapper.login(user);	// 로그인 요청 반환값
		
		if(check_login==1) {	// 로그인 성공
			int signup_complete=Mmapper.checkVaildSignup(user);		// 회원가입 추가정보 입력 여부 검증값
			if(signup_complete==1) {
				// 로그인 세션 부여
				// ** 세션에서 보유하는 정보: 로그인 여부, 로그인 아이디, 로그인 시각, 로그인 유저 닉네임 및 고유 키 **
				long timesource = System.currentTimeMillis();
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 aa hh:mm:ss");
		        String time=sdf.format(timesource);
		        
		        session.setAttribute("loginTime", time);
				session.setAttribute("userID", id);
				session.setAttribute("loginOK", "yes");
				session.setAttribute("saveid", saveid); // 체크 할 경우 null, 체크하면 on
				
				String userKey=Mmapper.getUserKey(id);
				String nickname=Mmapper.getNickname(userKey);
				
				session.setAttribute("userNickname", nickname);
		        session.setAttribute("userKey", userKey);
		        
				System.out.println(saveid==null?"Login ID: "+id+" / saveID? NO":"Login ID: "+id+" / saveID? YES");
				System.out.println("MESSAGE: 로그인 성공!\n로그인 시각: "+time);
				return "redirect:main";
			} else {	// 추가정보 입력하지 않았을 경우(signup_complete==0)
 				String userKey=Mmapper.getUserKey(id);
		        redirectAttributes.addFlashAttribute("member_idx", userKey);
				return "redirect:addinfo";
			}
		} else {	// 로그인 실패
			return "/member/member_loginFail";
		}
	}
	
	/* 회원 로그아웃 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 세션 회원 정보 삭제
		session.removeAttribute("loginTime");	// 로그인 시각
		session.removeAttribute("userID");	// 로그인 아이디
		session.removeAttribute("loginOK");	// 로그인 여부
		session.removeAttribute("userNickname");	// 로그인 닉네임
		session.removeAttribute("userKey");		// 로그인 Key
		System.out.println("MESSAGE: 로그아웃이 성공적으로 수행되었습니다.");
		return "redirect:main";
	}
	
	/* 계정 정보 찾기 페이지 */
	@GetMapping("/findaccount")  
	public String member_findaccount() {
		return "/member/member_accountFindForm";
	}
	
	/* 이메일로 아이디 찾기 */
	@PostMapping("/findid_email")  
	public String findid_email(Model model,
			@RequestParam String name,
			@RequestParam String email) {
		HashMap<String, String> finder=new HashMap<>();
		finder.put("name", name);
		finder.put("email", email);
		
		String finderResult=Mmapper.findIdByEmail(finder);
		if(finderResult==null ) {
			return "/member/member_findIdFail";
		} else {
			model.addAttribute("finderResult", finderResult);
			return "/member/member_findIdResult";
		}
	}
	
	/* 연락처로 아이디 찾기 */
	@PostMapping("/findid_number")  
	public String findid_number(Model model,
			@RequestParam String name,
			@RequestParam String contact_number) {
		HashMap<String, String> finder=new HashMap<>();
		finder.put("name", name);
		finder.put("contact_number", contact_number);
		
		String finderResult=Mmapper.findIdByContactNumber(finder);
		if(finderResult==null ) {
			return "/member/member_findIdFail";
		} else {
			model.addAttribute("finderResult", finderResult);
			return "/member/member_findIdResult";
		}
	}
	
	/* 아이디 찾기 결과 페이지 */
	@GetMapping("/findidresult")  
	public String member_findidresult() {
		return "/member/member_findIdResult";
	}
	
	/* 비밀번호 찾기 */
	@PostMapping("/findpw")  
	public String findpw(@ModelAttribute MemberDto m_dto,
			Model model,
			RedirectAttributes redirectAttributes) {

		String member_idx=Mmapper.searchForResetPw(m_dto);
		redirectAttributes.addFlashAttribute("resetMember_idx",member_idx);
		
		return "redirect:userpwreset";
	}
	
	/* 마이페이지 비밀번호 재설정 */
	@PostMapping("/myinfopw")  
	public String myinfopw(
			@RequestParam String member_idx,
			@ModelAttribute MemberDto m_dto,
			Model model,
			RedirectAttributes redirectAttributes) {

		//String member_idx=Mmapper.searchForResetPw(m_dto);
		redirectAttributes.addFlashAttribute("resetMember_idx",member_idx);
		model.addAttribute("resetMember_idx", member_idx);
		
		System.out.println(member_idx);
		
		return "redirect:userpwreset";
	}
	
	/* 비밀번호 재설정 페이지 */
	@GetMapping("/userpwreset")  
	public String userPwReset(@ModelAttribute MemberDto m_dto) {
		
		Mmapper.modMemberPw(m_dto);
		return "/member/member_userPwReset";
	}
	
	/* 비밀번호 재설정 처리 */
	@PostMapping("/pwresetprocess")  
	public String pwresetprocess(@ModelAttribute MemberDto m_dto) {
		
		Mmapper.modMemberPw(m_dto);
		return "/member/member_pwChangeComplete";
	}
}
