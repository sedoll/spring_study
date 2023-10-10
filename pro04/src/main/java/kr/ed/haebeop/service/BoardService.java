package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.Report;

import java.util.List;

public interface BoardService {
    public List<Board> boardList() throws Exception;
    public Board boardDetail(int bno) throws Exception;
    public void boardInsert(Board dto) throws Exception;
    public void boardDelete(int bno) throws Exception;
    public void boardEdit(Board dto) throws Exception;
    public void countUp(int bno) throws Exception;
    public List<Board> commentList(int bno) throws Exception;
    public void commentInsert(Board dto) throws Exception;
    public void commentDeleteAll(int bno) throws Exception;
    public List<Board> allCommentList() throws Exception;
    void reportBoard(Report report) throws Exception;
    int checkReported(Report report) throws Exception;
    public List<Board> boardReportList() throws Exception;
    public List<Board> recentReportList() throws Exception;
}
