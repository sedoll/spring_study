package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.BoardDAO;
import kr.co.teaspoon.dao.BoardDAOImpl;
import kr.co.teaspoon.dto.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardDAO boardDAO;

    @Override
    public List<Board> boardList() throws Exception {
        return boardDAO.boardList();
    }

    @Override
    public Board boardDetail(int bno) throws Exception {
        return boardDAO.boardDetail(bno);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        boardDAO.boardInsert(dto);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        boardDAO.boardDelete(bno);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        boardDAO.boardEdit(dto);
    }

    @Override
    public void countUp(int bno) throws Exception {

    }

    @Override
    public List<Board> commentList(int bno) throws Exception {
        return boardDAO.commentList(bno);
    }
}
