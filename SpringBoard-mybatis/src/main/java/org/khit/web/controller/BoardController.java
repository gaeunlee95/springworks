package org.khit.web.controller;

import java.util.List;

import org.khit.web.dto.BoardDTO;
import org.khit.web.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor  //������ ����
@Slf4j
@RequestMapping("/board")
@Controller
public class BoardController {
	
	private BoardService boardService;
	
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
		return "redirect:/board/"; //list.jsp�� �̵�
	}
	
	//�۸��
	@GetMapping("/")
	public String getList(Model model) {
		List<BoardDTO> boardDTOList = boardService.findAll();
		model.addAttribute("boardlist", boardDTOList);
		return "/board/boardlist";
	}
	
	//�ۻ󼼺���
	// /board?id
		@GetMapping
		public String getBoard(@RequestParam("id") Long id, Model model) {
			 BoardDTO boardDTO = boardService.findById(id);
			model.addAttribute("board", boardDTO);
			return "/board/detail";
		}
		
}