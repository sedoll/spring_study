package com.spring01.service;

import com.spring01.dto.Board;
import com.spring01.mapper.BoardMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BoardServiceImpl {
    @Autowired
    private BoardMapper boardMapper;

    // 목록
    public List<Board> bList() {
        try { // 예외 처리 안하면 데이터가 없는 경우 에러 발생
            List<Board> res = boardMapper.boardList();
            return boardMapper.boardList();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
    // 상세
    public Board bDetail(Integer no) {
        try {
            Board res = boardMapper.boardDetail(no);
            return res;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
    // 추가
    public boolean bInsert(Board board) {
        try {
            boardMapper.boardInsert(board);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    // 수정
    public boolean bUpdate(Board board) {
        try {
            boardMapper.boardUpdate(board);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    // 삭제
    public boolean bDelete(Integer no) {
        try {
            boardMapper.boardDelete(no);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}
