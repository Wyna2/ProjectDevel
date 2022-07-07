package com.ruby.devel.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;

import com.ruby.devel.model.TeamDto;
import com.ruby.devel.model.TeamMemberDto;
import com.ruby.devel.model.TeamNoticeDto;
import com.ruby.devel.model.MemberDto;
import com.ruby.devel.service.impl.MemberMapper;
import com.ruby.devel.service.impl.TeamMapper;

@Controller
public class GroundController {

	@Autowired
	TeamMapper Cmapper;

	@Autowired
	MemberMapper Mmapper;

	@GetMapping("/ground") // 메뉴 선택 시 이동하는 기본 페이지
	// ModelAndView!!
	public ModelAndView ground_home(Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, @ModelAttribute TeamDto crew_dto,
			@ModelAttribute TeamMemberDto cm_dto, @ModelAttribute MemberDto m_dto, HttpSession session) {
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
		
		List<TeamDto> list = Cmapper.getList(map);

		for(TeamDto c:list)
		{
			int membercount = Cmapper.selectCrewMem(c.getTeam_idx());
			c.setMember_count(membercount);
		
		} 
		
		// 각 글앞에 붙일 시작번호 구하기
		// 총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
		int no = totalCount - (currentPage - 1) * perPage;

		
		
		// 출력에 필요한 변수들을 request 에 저장
		mview.addObject("list", list);
		mview.addObject("startPage", startPage);
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
		
		String crewTeam_idx = Mmapper.getTeamidxMember(userKey);
		model.addAttribute("crewTeam_idx", crewTeam_idx);

		String userID = (String) session.getAttribute("userID");
		
		String age = Mmapper.getMemberAge(userKey);
		String name = Mmapper.getName(userKey);
	
		
		model.addAttribute("age", age);
		model.addAttribute("name", name);
		System.out.println("name+이름" + name);
		

		List<TeamDto> newlist = Cmapper.getNewCrewDatas();
		List<TeamDto> pointlist = Cmapper.getCrewPointDatas();
		model.addAttribute("newlist", newlist);
		model.addAttribute("pointlist", pointlist);
		

		mview.setViewName("/ground/ground_main");

		return mview; // /ground/(파일명)
	}
	
	  @GetMapping("/team/search")
	   public ModelAndView TeamSearch(
	         @RequestParam (value = "currentPage",defaultValue = "1") int currentPage,
	         @RequestParam(value = "SearchText",required = false) String SearchText,
	         HttpSession session, Model model)
	   {
	      session.setAttribute("SearchText", SearchText);
	      ModelAndView mview = new ModelAndView();
	      int totalCount=Cmapper.getSearchCount(SearchText);
	      
	      
	      //페이징처리에 필요한 변수
	      int totalPage; //총 페이지수
	      int startPage; //각블럭의 시작페이지
	      int endPage; //각블럭의 끝페이지
	      int start; //각페이지의 시작번호..한페이지에서 보여질 시작 글 번호(인덱스에서 보여지는 번호)
	      int perPage=8; //한페이지에 보여질 글 갯수
	      int perBlock=2; //한블럭당 보여지는 페이지 개수
	      
	      //총페이지 개수구하기
	      totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	                           
	      //각블럭의 시작페이지
	      startPage=(currentPage-1)/perBlock*perBlock+1;
	      endPage=startPage+perBlock-1;
	                           
	      if(endPage>totalPage)
	         endPage=totalPage;
	                  
	      //각페이지에서 불러올 시작번호
	      start=(currentPage-1)*perPage;
	      
	   

			// 각페이지에서 필요한 게시글 가져오기
			
			
	      
	      
	      //데이터 가져오기
	      HashMap<String, Object> map2 = new HashMap<>();
	      map2.put("SearchText", SearchText);
	      map2.put("start", start);
	      map2.put("perPage", perPage);
	      
	      //각페이지에서 필요한 게시글 가져오기
	      List<TeamDto> Searchlist=Cmapper.SearchGetList(map2);
	     

			for(TeamDto c:Searchlist)
			{
				int membercount = Cmapper.selectCrewMem(c.getTeam_idx());
				c.setMember_count(membercount);
			
			} 
	      
	      //총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
	      int no=totalCount-(currentPage-1)*perPage;
	      
	      //출력에 필요한 변수들 request 저장
	      mview.addObject("Searchlist",Searchlist);
	      mview.addObject("startPage",startPage);
	      mview.addObject("endPage",endPage);
	      mview.addObject("totalPage",totalPage);
	      mview.addObject("totalCount",totalCount);
	      mview.addObject("no",no);
	      mview.addObject("currentPage",currentPage);
	      
	      
	      mview.addObject("totalCount",totalCount);
	      
	      String userKey = (String) session.getAttribute("userKey");
	      String team_idx = Cmapper.selectTeamIdx(userKey);
	      model.addAttribute("team_idx", team_idx);

	      String crewTeam_idx = Mmapper.getTeamidxMember(userKey);
	      model.addAttribute("crewTeam_idx", crewTeam_idx);

	      String age = Mmapper.getMemberAge(userKey);
	      model.addAttribute("age", age);
	      
	      List<TeamDto> newlist = Cmapper.getNewCrewDatas();
			List<TeamDto> pointlist = Cmapper.getCrewPointDatas();
			model.addAttribute("newlist", newlist);
			model.addAttribute("pointlist", pointlist);
	      
	      
	      mview.setViewName("/ground/ground_searchresult");
	      
	         
	      return mview;
	   }
	
	

	@PostMapping("/ground/mymm")
	public String mycrewpr(@ModelAttribute TeamMemberDto cm_dto, HttpSession session, @RequestParam String team_idx,
			Model model) {
		String userKey = (String) session.getAttribute("userKey");
		cm_dto.setMember_idx(userKey);
		cm_dto.setTeam_idx(team_idx);
		int check_apply = Cmapper.checkVaildInsert(userKey);
		if(check_apply != 0 ) {
			model.addAttribute("member_idx", userKey);
			return "/ground/ground_crewApplyFail";
		} else {
			Cmapper.insertIntoMyCrew(cm_dto);
			return "/ground/ground_crewApplySuccess";
		}
	}
	
	
	@PostMapping("/ground/mymm_r")
	public String mycrewpr2(@ModelAttribute TeamMemberDto cm_dto, HttpSession session,
			Model model) {
		String userKey = (String) session.getAttribute("userKey");
		cm_dto.setMember_idx(userKey);
		Cmapper.deleteCrewMember(userKey);

		
		return "/ground/ground_crewDeleteSuccess";
		}

	@GetMapping("/ground/crewenroll") // 크루 등록 페이지
	public String ground_crewenroll() {
		return "/ground/ground_crewEnrollForm";
	}
	
	/* crewname 검증(중복확인) */
	@ResponseBody
	@GetMapping("/ground/crewnamecheck")
	public Map<String, Integer> crewnameCheckProcess(@RequestParam String name) {
		Map<String, Integer> map=new HashMap<>();
		int check=Cmapper.checkVaildCrewname(name);
		map.put("vaildCrewname", check);
		
		return map;
	}

	@PostMapping("/ground/mycrew") // 나의 크루 페이지
	public ModelAndView ground_mycrew(@RequestParam String team_idx, Model model) {

		// 나의 크루니까 내 팀 정보 가지고 옴 (마이크루 페이지에 크루명, 크루 소개 머 이런 거)
		TeamDto crew_dto = Cmapper.getTeamInfo(team_idx);

		// 팀의 멤버를 나타낼 칸을 뽑아내려고... 글서 cm_dto.size() 뽑으면 인원 수임
		List<TeamMemberDto> cm_dto = Cmapper.getTeamMember(team_idx);

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
		
		ModelAndView mview = new ModelAndView();
		mview.addObject("crew_dto", crew_dto);
		mview.addObject("cm_dto", cm_dto);
		mview.addObject("m_dto", m_dto);
		System.out.println("m_dto===>"+m_dto);
		
		List<TeamNoticeDto> teamnoticelist = Cmapper.selectTeamNotice();
		model.addAttribute("teamnoticelist", teamnoticelist);
		
		

		mview.setViewName("/ground/ground_myCrew");

		return mview;
	}
	
	@GetMapping("/ground/crewdel")
	public String crewdel(@RequestParam String member_idx) {
		Cmapper.deleteCrew(member_idx);
		Mmapper.updateCrewdelMemberidx(member_idx);
	
		return "redirect:/ground";
	
	}
	
	@GetMapping("/ground/crewmemberdel")
	public void crewmemberdel(@RequestParam String member_idx) {
		Cmapper.deleteCrewMember(member_idx);
		Mmapper.updateCrewdelMemberidx(member_idx);
	}

	@PostMapping("/ground/crewinsert") // 크루 등록
	public String insert(@ModelAttribute TeamDto crew_dto, @RequestParam String userKey,
			@ModelAttribute TeamMemberDto cm_dto) {

		crew_dto.setMember_idx(userKey);
		Cmapper.insertCrewEnroll(crew_dto); // 크루 생성+팀장 등록

		// System.out.println("발급된 team_idx: " + dto.getTeam_idx());

		HashMap<String, String> map = new HashMap<>();
		map.put("team_idx", crew_dto.getTeam_idx());
		map.put("member_idx", userKey);

		Cmapper.updateTeamIdx(map); //팀장 team_idx member 테이블에 update

		// System.out.println("dto 등록123: "+dto.getMember_idx());
		cm_dto.setMember_idx(crew_dto.getMember_idx());
		Cmapper.insertCrewleader(cm_dto); // 팀 멤버 테이블에 추가
		Cmapper.crewleaderupdate(crew_dto); // 리더는 자동으로 수락 y

		return "redirect:/ground";
	}
	
	@PostMapping("/ground/noticeinsert")
		public String noticeinsert(@ModelAttribute TeamNoticeDto tn_dto, @RequestParam String team_idx,
				@RequestParam String notice) {
		tn_dto.setTeam_idx(team_idx);
		tn_dto.setNotice(notice);
		Cmapper.insertIntoCrewNotice(tn_dto);
		
		
		return "redirect:/ground";
	
	
	}

	@PostMapping("/ground/test123")
	@ResponseBody
	public TeamDto updateform(@RequestParam String team_idx) {
		ModelAndView model = new ModelAndView();

		TeamDto crew_dto = Cmapper.getData(team_idx);
		model.addObject("dto", crew_dto);

		model.setViewName("/ground/ground_main");

		return crew_dto;

	}

	// 크루원 프로필 보기
	@PostMapping("/ground/memberprofile")
	@ResponseBody
	public MemberDto memberprofile(@RequestParam String member_idx) {

		MemberDto m_dto = Mmapper.getMemberDatas(member_idx);
		
		//ModelAndView mview = new ModelAndView();
		
		//CrewEnrollDto dto = Cmapper.getTeamInfo(team_idx);
		//mview.addObject("dto", dto);
		
		return m_dto;
		/*
		 * List<MemberDto> m_idx = new ArrayList<>(); // 여기는 member_idx들만 있음 for (int i
		 * = 0; i < m_idx.size(); i++) { // 쿼리문에 보면 select * ~ 다 가지고 오는 것들 중에
		 * member_idx가 있음 // member 테이블을 가지고 올 거면 member_idx가 필요
		 * 
		 * m_idx.add(Mmapper.getMemberDatas(member_idx)); // 빈 리스트에 넣는 이유는 여러 개 가져와야 해서
		 * }
		 * 
		 * return m_idx;
		 */
	}
	
	

	@PostMapping("/ground/memberapplylist")
	@ResponseBody
	public List<MemberDto> memberApplyList(@RequestParam String team_idx) {

		// 크루 신청현황 불러오기
		List<TeamMemberDto> cm_list = Cmapper.crewApplyList(team_idx);

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
		Cmapper.updateTeamidxY(member_idx);
	}

	@PostMapping("/ground/memberreject")
	@ResponseBody
	public void memberReject(@RequestParam String member_idx) {

		Cmapper.crewMemberReject(member_idx);
	}
}
