package org.khit.myapp.sample;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
//@AllArgsConstructor	//생성자(매개변수가 있는 생성자)
@NoArgsConstructor	//기본 생성자(매개변수가 없는 생성자)
@Component	//@Controller, @Repository(DAO), @Service 의 부모
public class Employee {
}
