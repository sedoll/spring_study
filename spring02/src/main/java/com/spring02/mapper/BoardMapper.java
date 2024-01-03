package com.spring02.mapper;

import com.spring02.dto.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<Board> boardList();
    Board boardDetail(Integer no);
    void boardInsert(Board board);
    void boardUpdate(Board board);
    void boardDelete(Integer no);
}
