package com.ruby.devel;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.ruby.*"})
@MapperScan("com.ruby.*")
public class ProjectRubyApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectRubyApplication.class, args);
	}

}
