package com.green.board.application.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//board테이블에 post통신으로 들어오는 요청
@Setter
@Getter
@ToString
public class BoardPostReq {
    //private 멤버필드에 값넣는방법 2가지
    //생성자 or 세터 생성
    private String title;
    private String contents;
}
