package org.khit.myapp.controller;

import java.util.List;

import org.khit.myapp.dto.BoardDTO;
import org.khit.myapp.repository.BoardRepository;
import org.khit.myapp.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor // 매개변수가 있는 생성자, eq boardRepository = new BoardRepository()
@Slf4j //log
@RequestMapping("/board")
@Controller	//bean 객체로 등록
public class BoardController {
	
	//생성자 주입 new
	@Autowired
	//private BoardRepository boardRepository;
	private BoardService boardService;
	
	//글쓰기 폼 페이지
	@GetMapping("/write")
	public String writeForm() {
		return "/board/write";	// eq /board/write.jsp
	}
	
	//글쓰기 처리
	@PostMapping("/write")
	public String write(@ModelAttribute BoardDTO boardDTO) {
		//@RequestParam("boardTitle") String boardTitle
		log.info("boardDTO=" + boardDTO); //문자형식으로 변환(Slf4j는 문자형식을 받음)
		boardService.save(boardDTO);
		return "redirect:/board/list";	//eq response.sendRedirect()
	}
	
	//글 목록
	@GetMapping("/list")
	public String getListAll(Model model)	{
		List<BoardDTO> boardDTOList = boardService.getListAll();
		model.addAttribute("boardList", boardDTOList);
		//request.setAttribute()
		return "/board/list";
	}
	
	//글 상세보기
	//board?id=1
	@GetMapping
	public String getBoard(@RequestParam("id") Long id, Model model) {
		BoardDTO boardDTO = boardService.findById(id);
		model.addAttribute("board", boardDTO);
		return "/board/detail";
	}
	
	//글 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam("id") Long id) {
		boardService.delete(id);
		return "redirect:/board/list";
	}
	
	//글 수정 페이지
	@GetMapping("/update")
	public String update(@RequestParam("id") Long id, Model model) {
		//수정할 해당 글 가져오기
		BoardDTO boardDTO = boardService.findById(id);
		model.addAttribute("board", boardDTO);
		return "/board/update";
	}
	
	//글 수정 처리
	@PostMapping("/update")
	public String update(@ModelAttribute BoardDTO boardDTO) {
		boardService.update(boardDTO);
		return "redirect:/board/list";
	}
}
