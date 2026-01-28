package com.green.board.application.model;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class BoardPutReq {
    private int id;
    private String title;
    private String contents;
}
