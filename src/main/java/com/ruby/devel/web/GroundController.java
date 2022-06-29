package com.ruby.devel.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ruby.devel.model.CrewEnrollDto;
import com.ruby.devel.model.CrewMemberDto;
import com.ruby.devel.model.MemberDto;
import com.ruby.devel.service.impl.MemberMapper;
import com.ruby.devel.service.impl.crewenrollMapper;

@Controller
public class GroundController {

	@Autowired
	crewenrollMapper Cmapper;

	@Autowired
	MemberMapper Mmapper;

	@GetMapping("/ground") // 메뉴 선택 시 이동하는 기본 페이지
	// ModelAndView!!
	public ModelAndView ground_home(Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, @ModelAttribute CrewEnrollDto dto,
			@ModelAttribute CrewMemberDto cm_dto, @ModelAttribute MemberDto m_dto, HttpSession session) {
		ModelAndView mview = new ModelAndView();

		int totalCount = Cmapper.getTotalCount();

		// 페이징처리에 필요한 변수
		int totalPage; // 총 페이지수
		int startPage; // 각블럭의 시작페이지
		int endPage; // 각블럭의 끝페이지
		int start; // 각페이지의 시작번호
		int perPage = 7; // 한페이지에 보여질 글 갯수
		int perBlock = 5; // 한블럭당 보여지는 페이지 개수

		// 총페이지 개수구하기
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

		// 각블럭의 시작페이지
		// 예:현재페이지가 3인경우 startpage=1,endpage= 5
		// 현재페이지가 6인경우 startpage=6,endpage= 10
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		// 만약 총페이지가 8 -2번째블럭: 6-10 ..이럴경우는 endpage가 8로 수정되어야함
		if (endPage > totalPage)
			endPage = totalPage;

		// 각페이지에서 불러올 시작번호
		start = (currentPage - 1) * perPage;

		// service 안 넣을 경우
		// 데이타 가져오기..map처리
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("perPage", perPage);

		// 각페이지에서 필요한 게시글 가져오기
		List<CrewEnrollDto> list = Cmapper.getList(map);

		// 각 글앞에 붙일 시작번호 구하기
		// 총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
		int no = totalCount - (currentPage - 1) * perPage;

		// 출력에 필요한 변수들을 request 에 저장
		mview.addObject("list", list);
		mview.addObject("startPage", startPage);
		// System.out.println(startPage);
		// System.out.println(endPage);
		mview.addObject("endPage", endPage);
		mview.addObject("totalPage", totalPage);
		mview.addObject("totalCount", totalCount);
		mview.addObject("no", no);
		mview.addObject("currentPage", currentPage);
		mview.addObject("totalCount", totalCount);

		// member에 team_idx를 가지고 오기 위해서 세션에 있는 uesrKey 가지고 옴
		// member_idx(userKey)를 통해서 member 테이블의 team_idx를 가지고 오려고
		// 세션에 로그인된 나라는 사람의 member테이블 member_idx에 해당하는 team_idx
		String userKey = (String) session.getAttribute("userKey");

		// #{member_idx} 객체에 userKey를 넣어주고
		String team_idx = Cmapper.selectTeamIdx(userKey);
		// Model 객체는 Controller 에서 생성된 데이터를 담아 View 로 전달할 때 사용하는 객체
		// team_idx를 ground_main 페이지에 붙여
		model.addAttribute("team_idx", team_idx);

		String age = Mmapper.getMemberAge(userKey);
		System.out.println("연령대" + age);
		model.addAttribute("age", age);

		List<CrewEnrollDto> newlist = Cmapper.getNewCrewDatas();
		List<CrewEnrollDto> pointlist = Cmapper.getCrewPointDatas();
		model.addAttribute("newlist", newlist);
		model.addAttribute("pointlist", pointlist);

		/*
		 * // 작성자 이름, 닉네임 갖고오기 System.out.println(list); String userKey =
		 * list.get(0).getMember_idx(); // userKey가 member의 member_idx String memberidx
		 * = Mmapper.getUserKey(null);
		 * 
		 * mview.addObject("memberidx", memberidx);
		 */

		// System.out.println(newlist);
		// System.out.println(list);
		mview.setViewName("/ground/ground_main");

		return mview; // /ground/(파일명)
	}

	@PostMapping("/ground/mymm")
	public String mycrewpr(@ModelAttribute CrewMemberDto cm_dto, HttpSession session, 
			@RequestParam String team_idx) {
		String userKey = (String) session.getAttribute("userKey");
		cm_dto.setMember_idx(userKey);
		cm_dto.setTeam_idx(team_idx);
		Cmapper.insertIntoMyCrew(cm_dto);
		return "/ground/ground_crewApplySuccess";
	
	}

	@GetMapping("/ground/crewenroll") // 크루 등록 페이지
	public String ground_crewenroll() {
		return "/ground/ground_crewEnrollForm";
	}

	@PostMapping("/ground/mycrew") // 나의 크루 페이지

	public ModelAndView ground_mycrew(@RequestParam String team_idx,
			Model model) {

		// 나의 크루니까 내 팀 정보 가지고 옴 (마이크루 페이지에 크루명, 크루 소개 머 이런 거)
		CrewEnrollDto dto = Cmapper.getTeamInfo(team_idx);
		System.out.println("CrewEnrollDto:  " + dto);

		// 팀의 멤버를 나타낼 칸을 뽑아내려고... 글서 cm_dto.size() 뽑으면 인원 수임
		List<CrewMemberDto> cm_dto = Cmapper.getTeamMember(team_idx);
		System.out.println("cm_dto:   " + cm_dto);

		List<String> m_idx = new ArrayList<>(); // 여기는 member_idx들만 있음
		for (int i = 0; i < cm_dto.size(); i++) {
			// 쿼리문에 보면 select * ~ 다 가지고 오는 것들 중에 member_idx가 있음
			// member 테이블을 가지고 올 거면 member_idx가 필요
			String member_idx = cm_dto.get(i).getMember_idx();
			m_idx.add(new String(member_idx)); // 빈 리스트에 넣는 이유는 여러 개 가져와야 해서
		}

		List<MemberDto> m_dto = new ArrayList<>(); // m_dto라는 리스트에는 member_idx를 넣어서 가지고 온 member 테이블의 정보가 담김
		for (int j = 0; j < m_idx.size(); j++) // 위에서 member_idx를 찾아서 빈 리스트에 넣어줬으니 그 빈 리스트를 가지고 와서
		{
			m_dto.add(Mmapper.getMemberDatas(m_idx.get(j))); // cm_dto 사이즈랑 m_idx 사이즈는 같음

		}

		System.out.println("m_dto=======>"+m_dto);
		
		
		
	
	   
		ModelAndView mview = new ModelAndView();
		mview.addObject("dto", dto);
		mview.addObject("cm_dto", cm_dto);
		mview.addObject("m_dto", m_dto);
	

		mview.setViewName("/ground/ground_myCrew");

		return mview;
	}

	@PostMapping("/ground/crewinsert") // 크루 등록
	public String insert(@ModelAttribute CrewEnrollDto dto, @RequestParam String userKey,
			@ModelAttribute CrewMemberDto cm_dto) {

		dto.setMember_idx(userKey);
		Cmapper.insertCrewEnroll(dto); // 크루 생성+팀장 등록
		
		//System.out.println("발급된 team_idx: " + dto.getTeam_idx());

		HashMap<String, String> map = new HashMap<>();
		map.put("team_idx", dto.getTeam_idx());
		map.put("member_idx", userKey);

		Cmapper.updateTeamIdx(map);

	
		
		//System.out.println("dto 등록123: "+dto.getMember_idx());
		cm_dto.setMember_idx(dto.getMember_idx());
		Cmapper.insertCrewleader(cm_dto); // 팀 멤버 테이블에 추가
		Cmapper.crewleaderupdate(dto); // 리더는 자동으로 수락 y

		return "redirect:/ground";
	}

	@PostMapping("/ground/test123")
	@ResponseBody
	public CrewEnrollDto updateform(@RequestParam String team_idx) {
		ModelAndView model = new ModelAndView();

		// System.out.println(team_idx);

		CrewEnrollDto dto = Cmapper.getData(team_idx);
		model.addObject("dto", dto);

		 System.out.println("dto....."+dto);

		model.setViewName("/ground/ground_main");

		return dto;

	}
	
	@PostMapping("/ground/memberapplylist")
	@ResponseBody
	public List<MemberDto> memberApplyList(@RequestParam String team_idx) {
		
		//크루 신청현황 불러오기
	   List<CrewMemberDto> cm_list =  Cmapper.crewApplyList(team_idx);
	   System.out.println("cm_list=======>"+cm_list);
	   
	   
	   List<MemberDto> m_dto_n = new ArrayList<>();
	   for (int i = 0; i < cm_list.size(); i++) {
		   m_dto_n.add(Mmapper.getMemberDatas(cm_list.get(i).getMember_idx()));
	   }
	   
	   return m_dto_n;
	}
	
	
	@PostMapping("/ground/memberaccept")
	@ResponseBody
	public void memberAccept(@RequestParam String member_idx) {
		
		Cmapper.crewMemberAccept(member_idx);
	}
	
	@PostMapping("/ground/memberreject")
	@ResponseBody
	public void memberReject(@RequestParam String member_idx) {
		
		Cmapper.crewMemberReject(member_idx);
	}
}
