package com.spring01.mapper;

import com.spring01.dto.Board;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<Board> boardList();
    Board boardDetail(Integer no);
    void boardInsert(Board board);
    void boardUpdate(Board board);
    void boardDelete(Integer no);
}
