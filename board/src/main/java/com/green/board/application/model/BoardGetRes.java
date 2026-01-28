package com.green.board.application.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardGetRes {
    private int id;
    private String title;
    private String createdAt;
}
