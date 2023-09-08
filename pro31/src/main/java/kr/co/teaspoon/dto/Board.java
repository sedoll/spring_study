package kr.co.teaspoon.dto;

import lombok.Data;

// get, set, 생성자 모두 사용가능하게 하는 코드 Data
@Data
public class Board {
    private int seq;
    private String title;
    private String content;
    private String nickname;
    private String regdate;
    private int visited;
}
