package com.ruby.devel.model;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("c_dto")
public class CommunityDto {
	
	private String community_idx;
	private String member_idx;
	private String tag1;
	private String tag2;
	private String tag3;
	private String subject;
	private String content;
	private String photo;
	private String like_count;
	private String read_count;
	private String content_type;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp write_day;
	
}
