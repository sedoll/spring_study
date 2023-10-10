package kr.ed.haebeop.repository;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.Report;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardTeaRepositoryImpl implements BoardRepository {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Board> boardList() throws Exception {
        return sqlSession.selectList("boardTea.boardList");
    }

    @Override
    public Board boardDetail(int bno) throws Exception {
        sqlSession.update("board.countUp", bno); // 이건 나중에 서비스 쪽에 넣어라
        return sqlSession.selectOne("boardTea.boardDetail", bno);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        sqlSession.insert("boardTea.boardInsert", dto);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        sqlSession.delete("boardTea.boardDelete", bno);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        sqlSession.update("boardTea.boardEdit", dto);
    }

    @Override
    public void commentInsert(Board dto) throws Exception {
        sqlSession.insert("boardTea.commentInsert", dto);
    }

    @Override
    public List<Board> commentList(int bno) throws Exception {
        return sqlSession.selectList("boardTea.commentList", bno);
    }

    @Override
    public void commentDeleteAll(int bno) throws Exception {
        sqlSession.delete("boardTea.commentDeleteAll", bno);
    }
    @Override
    public List<Board> allCommentList() throws Exception {
        return sqlSession.selectList("boardTea.allCommentList");
    }
    @Override
    public void reportBoard(Report report) throws Exception {
        sqlSession.insert("boardTea.reportBoard", report);
    }
    @Override
    public int checkReported(Report report) throws Exception {
        return sqlSession.selectOne("boardTea.checkReported",report);
    }
    @Override
    public List<Board> boardReportList() throws Exception {
        return sqlSession.selectList("boardTea.boardReportList");
    }
    @Override
    public List<Board> recentReportList() throws Exception {
        return sqlSession.selectList("board.recentReportList");
    }
}
