package org.khit.web.mapper;

import java.util.List;

import org.khit.web.dto.BoardDTO;

public interface BoardMapper {

	void insert(BoardDTO boardDTO);

	List<BoardDTO> findAll(); //글 목록

	BoardDTO findById(Long id); //글 상세보기

}
