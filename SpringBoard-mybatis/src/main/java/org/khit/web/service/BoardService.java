package org.khit.web.service;

import java.util.List;

import org.khit.web.dto.BoardDTO;

public interface BoardService {

	void insert(BoardDTO boardDTO);

	List<BoardDTO> findAll();

	BoardDTO findById(Long id);

}
