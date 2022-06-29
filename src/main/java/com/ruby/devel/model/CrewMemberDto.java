package com.ruby.devel.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("teammember")
public class CrewMemberDto {

	private String team_member_idx;
	private String team_idx;
	private String member_idx;
	private Timestamp regist_day;
	private String accept_status;
	private String mypr;
}
