package com.spring01.ctrl;

import com.spring01.dto.Board;
import com.spring01.service.BoardServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/board/*")
public class BoardCtrl {
    @Autowired
    private BoardServiceImpl boardService;

    @GetMapping("list")
    public String list(Model model) {
        List<Board> blist = boardService.bList();
        model.addAttribute("blist", blist);
        return "/board/list";
    }

    @GetMapping("detail")
    public String detail(@RequestParam("no") Integer no, Model model) {
        Board dto = boardService.bDetail(no);
        model.addAttribute("dto", dto);
        return "/board/detail";
    }

    @GetMapping("insert")
    public String insert() {
        return "/board/insert";
    }

    @PostMapping("insert")
    public String insertPro(Board board) {
        System.out.println(board.toString());
        boolean ck = boardService.bInsert(board);
        if(ck) {
            return "redirect:/board/list";
        } else {
            return "redirect:/";
        }
    }

    @GetMapping("update")
    public String update(@RequestParam("no") Integer no, Model model) {
        Board dto = boardService.bDetail(no);
        model.addAttribute("dto", dto);
        return "/board/update";
    }

    @PostMapping("update")
    public String updatePro(Board board) {
        boolean ck = boardService.bUpdate(board);
        if(ck) {
            return "redirect:/board/detail?no="+board.getNo();
        } else {
            return "redirect:/";
        }
    }

    @GetMapping("delete")
    public String delete(@RequestParam("no") Integer no) {
        boolean ck = boardService.bDelete(no);
        if(ck) {
            return "redirect:/board/list";
        } else {
            return "redirect:/";
        }
    }
}
