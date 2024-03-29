package org.khit.web.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PageDTO {
	private int page;		//현재 페이지
	private int maxPage;	//최대페이지(글 갯수에 따른 페이지)
	private int startPage;	//현재 페이지 기준 시작 페이지 값
	private int endPage;	//현재 페이지 기준 마지막 페이지 값
}
