package org.khit.web.service;

import java.util.List;

import org.khit.web.dto.BoardDTO;
import org.khit.web.dto.PageDTO;

public interface BoardService {

	void insert(BoardDTO boardDTO);

	List<BoardDTO> findAll();

	BoardDTO findById(Long id);

	void updateHit(Long id);

	void update(BoardDTO boardDTO);

	void delete(Long id);

	List<BoardDTO> pagingList(int page);

	PageDTO pagingParam(int page);


}
