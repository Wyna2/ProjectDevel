package com.ruby.devel.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("community")
public class CommunityDto {
	private String community_idx;
	private String member_idx;

	private String tag1; //태그1
	private String tag2; //태그2
	private String tag3; //태그3
	private String subject; //제목
	private String content; //내용
	private String photo; //사진
	private MultipartFile upload;
	private int like_count; //좋아요 수
	private int read_count; //조회 수
	private String content_type; //일반글 or 질문글 분류
	private Timestamp write_day; //작성날짜

	private int mcount; //댓글 수
	private String writer; //작성자 받아오기
	private String team_name;	// 크루 이름
	private String team_color;	// 크루 색상

}