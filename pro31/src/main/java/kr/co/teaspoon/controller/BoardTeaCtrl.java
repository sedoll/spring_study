package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.service.BoardService;
import kr.co.teaspoon.service.BoardTeaServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/boardTea/*")
public class BoardTeaCtrl {

    @Autowired
    private BoardTeaServiceImpl boardService;

    @Autowired
    HttpSession session; // 세션 생성

    @GetMapping("list.do")		// board/list.do
    public String getBoardList(HttpServletResponse response, Model model) throws Exception {
        if(session.getAttribute("sid") != null &&("admin".equals(session.getAttribute("sid")) || (Integer) session.getAttribute("job") == 2)) {
            List<Board> boardList = boardService.boardList();
            model.addAttribute("boardList", boardList);
            return "/boardTea/boardList";
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('해당 페이지는 선생님만 접근 가능합니다.');</script>");
            out.flush();
            return "/index";
        }
    }

    @GetMapping("detail.do")	// board/detail.do?bno=1
    public String getBoardDetail(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Board dto = boardService.boardDetail(bno);
        List<Board> comment = boardService.commentList(bno);
        model.addAttribute("dto", dto);
        model.addAttribute("comment", comment);
        System.out.println(comment.toString());
        return "/boardTea/boardDetail";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/boardTea/boardInsert";
    }

    @PostMapping("insert.do")
    public String boardInsert(HttpServletRequest request, Model model) throws Exception {
        Board dto = new Board();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setAuthor((String) session.getAttribute("sid"));
        boardService.boardInsert(dto);
        return "redirect:list.do";
    }

    @PostMapping("commentInsert.do")
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        Board dto = new Board();
        dto.setAuthor(request.getParameter("id"));
        dto.setBno(Integer.parseInt(request.getParameter("bno")));
        dto.setContent(request.getParameter("content"));
        boardService.commentInsert(dto);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String boardDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        boardService.boardDelete(bno);
        boardService.commentDeleteAll(bno);
        return "redirect:list.do";
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Board dto = boardService.boardDetail(bno);
        model.addAttribute("dto", dto);
        return "/boardTea/boardEdit";
    }

    @PostMapping("edit.do")
    public String boardEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Board dto = new Board();
        dto.setBno(bno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.boardEdit(dto);
        return "redirect:list.do";
    }
}
