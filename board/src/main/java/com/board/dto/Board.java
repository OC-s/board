package com.board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private Long number;
	private String title;
	private String contents;
	private String nickname;
	private String check; // 중요 체크
	
	private String keyword; // 검색 키워드
}
