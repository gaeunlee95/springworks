package org.khit.web.mapper;

import java.util.List;

import org.khit.web.dto.BoardDTO;

public interface BoardMapper {

	void insert(BoardDTO boardDTO);

	List<BoardDTO> findAll(); //�� ���

	BoardDTO findById(Long id); //�� �󼼺���

}
