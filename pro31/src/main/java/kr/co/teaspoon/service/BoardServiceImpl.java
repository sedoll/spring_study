package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.BoardDAO;
import kr.co.teaspoon.dao.BoardDAOImpl;
import kr.co.teaspoon.dto.Board;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService{

    private BoardDAO boardDAO = new BoardDAOImpl();

    @Override
    public List<Board> boardList() throws Exception {
        return boardDAO.boardList();
    }

    @Override
    public Board boardDetail(int seq) throws Exception {
        return boardDAO.boardDetail(seq);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        boardDAO.boardInsert(dto);
    }

    @Override
    public void boardDelete(int seq) throws Exception {
        boardDAO.boardDelete(seq);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        boardDAO.boardEdit(dto);
    }
}
