package com.xhc.push;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.xhc.push.**.mapper")
public class JpushApplication {

	public static void main(String[] args) {
		SpringApplication.run(JpushApplication.class, args);
	}
}

