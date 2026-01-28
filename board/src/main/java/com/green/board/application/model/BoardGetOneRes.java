package com.green.board.application.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardGetOneRes {
    //id, title, contents, created_at 데이터 담을 수 있는 객체
    //setter, getter도 만들기
    private int id;
    private String title;
    private String contents;
    private String createdAt;
}
