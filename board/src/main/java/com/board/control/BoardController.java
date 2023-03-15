package com.board.control;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.dto.Board;
import com.board.repository.BoardRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardRepository boardRepository;
	
	@GetMapping("")
	public String index() {
		return "redirect:/list";
	}
	
	@GetMapping("list")
	public String list(Model model) {
		List<Board> list = boardRepository.listAll();
		model.addAttribute("list", list);
		log.info("test : " + list);
		return "/board/list";
	}
	
	// 작성
	@GetMapping("write")
	public String write(Model model) {
		
		return "/board/write";
	}

	@PostMapping("write")
	public String writeOk(Board board, RedirectAttributes redirectAttributes) {
		
		Board save = boardRepository.writeOk(board);
		redirectAttributes.addAttribute("boardNumber", save.getNumber());
		redirectAttributes.addAttribute("status", true);
		
		return "redirect:/list";
	}
	
	// 조회
	@GetMapping("detail")
	public String detail(Model model, @RequestParam("number")long number) {
		Board list = boardRepository.detail(number);
		model.addAttribute("list", list);
		return "/board/detail";
	}
	
	// 수정
	@GetMapping("modify")
	public String modify(Model model, @RequestParam("number")long number) {
		Board list = boardRepository.detail(number);
		model.addAttribute("list", list);
		return "/board/modify";
	}
	@PostMapping("modify")
	public String modifyOk(@ModelAttribute("board")Board board, @RequestParam("number")long number) {
		boardRepository.modify(board, number);
		return "redirect:/list";
	}
	
	//삭제
	@GetMapping("delete")
	public String delete(@RequestParam("number")long number) {
		boardRepository.delete(number);
		return "redirect:/list";
	}
	
	
	
}
