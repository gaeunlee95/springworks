package com.khit.todoweb.dto;

import java.util.Arrays;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class PageRequestDTO { //파라미터(page, kw) 수집용 DTO
	
	private int page = 1;    //페이지 번호
	private int size = 10;   //페이지당 게시글 수
	
	private String[] types;  //검색 유형
	private String keyword;  //검색어
	
	//skip - 간격(범위) 
	public int getSkip() {  //#{skip}
		return (page - 1) * 10;   //1p-0, 2p-10
	}
	
	//검색유형 체크박스 체크
	public boolean checkType(String type) {
		//타입에 체크가 없으면 반환값이 없음
		if(types == null || types.length == 0) {
			return false;
		}
		
		//타입에 일치하는 유형을 반환함
		Arrays.stream(types).forEach(t -> log.info(t));
		return Arrays.stream(types).anyMatch(type::equals); //type에 일치되는 것을 반환
		//stream : 배열 안의 값을 스트림으로 변환
		//anyMatch("A" :: equals) : 스트림의 요소가 "A" 문자열과 동일한지 확인 
		//stream(배열) / anyMatch(검색유형::equals)
	}
}
