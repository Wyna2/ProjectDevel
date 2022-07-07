package com.ruby.devel.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("teamnotice")
public class TeamNoticeDto {

	private String team_notice_idx;
	private String team_idx;
	private String notice;
	private Timestamp writeday;
}
