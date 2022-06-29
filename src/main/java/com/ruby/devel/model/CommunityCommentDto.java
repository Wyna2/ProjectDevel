package com.ruby.devel.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("communitycomment")
public class CommunityCommentDto {
	private String community_comment_idx;
	private String community_idx;
	private String member_idx;
	private String content;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul" )
	private Timestamp write_day;
}
