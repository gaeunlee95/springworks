package org.khit.web.service;

import java.util.List;

import org.khit.web.dto.ReplyDTO;

public interface ReplyService {


	void insert(ReplyDTO replyDTO);
	
	List<ReplyDTO> getReplyList(Long boardId);

	void delete(Long id);

	ReplyDTO findById(Long id);

	void update(ReplyDTO replyDTO);
}
