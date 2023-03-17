package com.board.control;

import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.dto.Board;
import com.board.repository.BoardRepository;
import com.board.util.PageUtil;

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
	public String list(Model model, @RequestParam(name = "cp", defaultValue = "1")int currentPage) {
		
		// 총페이지수
		int tn = boardRepository.getTotal();
		int totalNumber = tn;
		
		//페이지당 게시물수
		int recordPerpage = 10;
		
		// 총페이지수,한페이지당수, 현재페이지
		Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerpage, currentPage);
		
		int startNo = (int)map.get("startNo");
		int endNo = (int)map.get("endNo");
		
		List<Board> list = boardRepository.listAll();
		
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		log.info("list : " + list);
		log.info("map : " + map);
		log.info("list : " + list.size());
		
		return "/board/list";
	}
	
	@GetMapping("search")
	public String searchlist(Model model,
							 @RequestParam(name = "cp", defaultValue = "1")int currentPage,
			 				 @RequestParam("type")String type,
					   		 @RequestParam("keyword")String keyword) {
		
		
		model.addAttribute("type" , type);
		model.addAttribute("keyword" , keyword);
		log.info("type : " + type);
		log.info("keyword : " + keyword);
		
		List<Board> listKey = boardRepository.searchlist(keyword,type);
		List<Board> list = boardRepository.searchlist(keyword,type);
		
		// 총페이지수
		int tn = boardRepository.getTotal();
		int totalNumber = tn;
		
		log.info("list tttttttttt: " + listKey);
		
		// 키워드입력 조회시 총갯수(cnt)
		int cnt = 0;
		if(keyword.length() > 0 && listKey.size() >0) {
			log.info("zzzzzzzzzzzzzzzzz"+listKey.get(cnt).getTitle());
			
			// 담아줄 리스트 청소
			list.clear();
			
			// 검색 타입 title (제목)
			if(type.equals("title")) {
				for(int i = 0; i < listKey.size(); i++) {
					if(keyword.equals(listKey.get(i).getTitle())) {
						log.info("title test : "+ listKey.get(i));
						list.add(listKey.get(i));
						cnt++;
						
					} else {
						log.info("title test f : "+ listKey.get(i));
					}
				}
				
			// 검색 타입 nickname (닉네임)
			} else if (type.equals("nickname")) {
				for(int i = 0; i < listKey.size(); i++) {
					if(keyword.equals(listKey.get(i).getNickname())) {
						log.info("nickname test : "+ listKey.get(i));
						list.add(listKey.get(i));
						cnt++;
						
					} else {
						log.info("nickname test f : "+ listKey.get(i));
					}
				}
				
			// 검색 타입 all = 검색내용선택X (닉네임,제목)
			} else if (type.equals("all") ) {
				for(int i = 0; i < listKey.size(); i++) {
					if(keyword.equals(listKey.get(i).getNickname()) || keyword.equals(listKey.get(i).getTitle())  ) {
						log.info("all test : "+ listKey.get(i));
						list.add(listKey.get(i));
						cnt++;
						
					} else {
						log.info("all test f : "+ listKey.get(i));
					}
				}
				
			} 
			
			totalNumber = cnt;
		}
		
		log.info("title cnt :" + cnt);
		
		//페이지당 게시물수
		int recordPerpage = 10;
		
		// 총페이지수,한페이지당수, 현재페이지
		Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerpage, currentPage);
		
		int startNo = (int)map.get("startNo");
		int endNo = (int)map.get("endNo");
		
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		
		log.info("list : " + list);
		log.info("list : " + list.size());
		log.info("map : " + map);
		
		return "/board/list";
	}
	
	
	
	// 작성
	@GetMapping("write")
	public String write(Model model) {
		List<Board> list = boardRepository.listAll();
		
		// 리스트의 값이 있는 경우에만 데이터를 넘겨줌 (마지막 닉네임 사용)
		if(list.size() > 0) {
			int lastIdx = list.size()-1;
			log.info("test : " + list.get(lastIdx));
			//log.info("test2 : " + list.get(lastIdx).getNickname());
			
			model.addAttribute("list", list.get(lastIdx));
		}
		
		return "/board/write";
	}

	@PostMapping("write")
	public String writeOk(Board board, RedirectAttributes redirectAttributes) {
		
		boardRepository.writeOk(board);
//		Board save = boardRepository.writeOk(board);
//		redirectAttributes.addAttribute("number", save.getNumber());
//		redirectAttributes.addAttribute("status", true);
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
