package com.ruby.devel.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ruby.devel.model.TeamDto;
import com.ruby.devel.model.TeamMemberDto;
import com.ruby.devel.model.TeamNoticeDto;

@Mapper
public interface TeamMapper {

	public int getTotalCount();
	public void insertCrewEnroll (TeamDto dto); //크루 등록
	public void updateTeamIdx(HashMap <String, String> map);
	public void insertCrewleader (TeamMemberDto cm_dto); //크루 리더 등록
	public void crewleaderupdate (TeamDto dto);
	public List<TeamDto> getNewCrewDatas(); //신규 크루
	public List<TeamDto> getCrewPointDatas(); //크루 순위
	public List<TeamDto> getList(HashMap<String, Integer> map);
	public TeamDto getData(String team_idx);
	public TeamDto getTeamInfo (String team_idx);
	public List<TeamMemberDto> getTeamMember (String team_idx);
	public String selectTeamIdx(String member_idx);
	public void insertIntoMyCrew (TeamMemberDto cm_dto);
	public List<TeamMemberDto> crewApplyList (String team_idx);
	public void crewMemberAccept (String member_idx);
	public void crewMemberReject (String member_idx);
	public int selectCrewMem (String team_idx);
	public void updateTeamidxY(String member_idx);
	public List<TeamDto> SearchGetList(HashMap<String, Object> map);
	public int getSearchCount(String SearchText);
	public void insertIntoCrewNotice(TeamNoticeDto tn_dto); //공지 등록
	public List<TeamNoticeDto> selectTeamNotice(); //공지 리스트
	public int checkVaildCrewname (String name);
	public void deleteCrew(String member_idx);
	public void deleteCrewMember(String member_idx);
	public int checkVaildInsert(String member_idx);
	
}

