package com.ruby.devel.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("communityscrap")
public class CommunityScrapDto {
	
	private String community_scrap_idx;
	private String community_idx;
	private String member_idx;
	private String scrap_count;
	
}