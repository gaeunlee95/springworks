package org.khit.web.mapper;

import java.util.List;

import org.khit.web.dto.ReplyDTO;

public interface ReplyMapper {

	void insert(ReplyDTO replyDTO);

	List<ReplyDTO> getReplyList(Long boardId);

	void delete(Long id);

	ReplyDTO findById(Long id);

	void update(ReplyDTO replyDTO);

}
