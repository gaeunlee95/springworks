package org.khit.web.controller;

import java.util.List;

import org.khit.web.dto.BoardDTO;
import org.khit.web.dto.PageDTO;
import org.khit.web.dto.ReplyDTO;
import org.khit.web.dto.UserDTO;
import org.khit.web.service.BoardService;
import org.khit.web.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//@AllArgsConstructor  //������ ����
@Slf4j
@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	
	//�۾��� ������
	@GetMapping("/write")
	public String writeForm() {
		return "/board/write";
	}
	
	//�۾��� ó��
	@PostMapping("/write")
	public String write(BoardDTO boardDTO) {
		log.info("boardDTO: " + boardDTO);
		boardService.insert(boardDTO);
		return "redirect:/board/paging"; //list.jsp�� �̵�
	}
	
	//�۸��
	@GetMapping("/")
	public String getList(Model model) {
		List<BoardDTO> boardDTOList = boardService.findAll();
		model.addAttribute("boardList", boardDTOList);
		return "/board/boardlist";
	}
	
	//�۸��(������ó��)
	// /board/paging?page=2
	// @RequestParam(required=true/false) false�� �ʼ� �ƴ�
	@GetMapping("paging")
	public String getPageList(Model model,
			@RequestParam(value="page", required=false, 
			defaultValue="1") int page) { //defaultValue: �⺻������
		log.info("page=" + page);
		//�������� �� ������ ������ ��� ����
		List<BoardDTO> pagingList = boardService.pagingList(page);
		log.info("pageList=" + pagingList);
		model.addAttribute("boardList", pagingList);
		model.addAttribute("page", page);
		
		//ȭ�� �ϴ� ����
		PageDTO pageDTO = boardService.pagingParam(page);
		model.addAttribute("paging", pageDTO);
		
		return "/board/pagelist";
	}
	
	//�ۻ󼼺���
	// /board?id
	@GetMapping
	public String getBoard(@RequestParam("id") Long id, @RequestParam(value="page", required=false, 
			defaultValue="1") int page, Model model) {
		//��ȸ�� ����
		boardService.updateHit(id);
		//�� �󼼺���
		BoardDTO boardDTO = boardService.findById(id);
		//��� ��� ����
		List<ReplyDTO> replyListDTO = replyService.getReplyList(id);
		 
		model.addAttribute("board", boardDTO);
		model.addAttribute("page", page);
		model.addAttribute("replyList", replyListDTO);
		return "/board/detail";
	}
	
	//�Խñ� ���� ������
	@GetMapping("/update")
	public String update(@RequestParam("id") Long id, Model model) {
		//�� ������ ��������
		BoardDTO boardDTO = boardService.findById(id);
		model.addAttribute("board", boardDTO);
		return "/board/boardupdate";
	}	
	
	//�Խñ� ����
	@PostMapping("/update")
	public String update(@ModelAttribute BoardDTO boardDTO) {
		//�� ������ ��������
		boardService.update(boardDTO);
		return "redirect:/board?id=" + boardDTO.getId();
	}
	
	//�Խñ� ����
	@GetMapping("/delete")
	public String deleteBoard(@RequestParam("id") Long id) {
		boardService.delete(id);
		return "redirect:/board/";
	
	}
}
