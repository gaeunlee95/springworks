package org.khit.web.service;

import java.util.List;

import org.khit.web.dto.ReplyDTO;
import org.khit.web.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service	//���񽺸� �����ϰ� ��(bean)�� �����
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public void insert(ReplyDTO replyDTO) {
		replyMapper.insert(replyDTO);
		
	}

	@Override
	public List<ReplyDTO> getReplyList(Long boardId) {
		return replyMapper.getReplyList(boardId);
	}

	@Override
	public void delete(Long id) {
		replyMapper.delete(id);
	}

	@Override
	public ReplyDTO findById(Long id) {
		return replyMapper.findById(id);
	}

	@Override
	public void update(ReplyDTO replyDTO) {
		replyMapper.update(replyDTO);
		
	}

}
