package com.ruby.dto;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("mdto")
public class MemberDto {

	private String member_idx;
	private String name;
	private String email;
	private String id;
	private String password;
	private String nickname;
	private String address;
	private String contact_number;
	private String photo;
	private String age;
	private Timestamp join_day;
	private String birth;
	private String hobby1;
	private String hobby2;
	private String hobby3;
	private String pr;
	private String link;
	private String job;	
	
}
