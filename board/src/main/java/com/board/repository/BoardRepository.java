package com.board.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.board.dto.Board;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class BoardRepository {
	
	private static final Map<Long,Board> map = new HashMap<>();
	private static long seq = 0L;
	
	// 전체조회
	public List<Board> listAll() {
		return new ArrayList<>(map.values());
	}
	
	
	// 검색 조회
	public List<Board> searchlist(String keyword, String type) {
		
		return new ArrayList<>(map.values());
		
//		log.info("re type :" +type );
//		log.info("re keyword :" +keyword );
//		log.info("map : " + map.values());
//		
//		List<Board> list = null;
//		if(type.equals("all")) {
//			log.info("type : all" );
//		} else if (type.equals("title")) {
//			log.info("type : title" );
//		} else if (type.equals("nickname")) {
//			log.info("type : nickname" );
//		}
//		
//		if(keyword == null || keyword.length() == 0) {
//			list = new ArrayList<>(map.values());
//			log.info("keyword : null ");
//		} else {
//			list = new ArrayList<>(map.values());
//			log.info("test : " + map.size() );
//			log.info("test : " + list. );
//		}
//		return list;
		
	}
	

	// 상세조회
	public Board detail(Long number) {
		return map.get(number);
	}
	
	
	// 작성
	public Board writeOk(Board board) {
		board.setNumber(++seq);
		map.put(board.getNumber(), board);
		return board;
	}
	
	
	// 수정
	public void modify(Board board, Long number) {
		Board boardDetail = detail(number);
		boardDetail.setNickname(board.getNickname());
		boardDetail.setTitle(board.getTitle());
		boardDetail.setContents(board.getContents());
	}
	
	
	//삭제
	public Board delete(Long number) {
		return map.remove(number);
	}
	
	public int getTotal() {
		return map.size();
	}
	
	
	
	
}
