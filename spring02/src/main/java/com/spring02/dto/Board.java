package com.spring02.dto;

import lombok.Data;

@Data
public class Board {
    private Integer no;
    private String title;
    private String content;
    private String id;
    private String created;
    private String updated;
}
