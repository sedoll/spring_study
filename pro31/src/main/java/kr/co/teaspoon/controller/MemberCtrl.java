package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.Member;
import kr.co.teaspoon.service.MemberService;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/member/*")
public class MemberCtrl {
    @Autowired
    private MemberService memberService;

    @Autowired
    HttpSession session;

    @RequestMapping(value = "list.do", method = RequestMethod.GET)
    public String memberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        model.addAttribute("title", "회원 목록");
        return "/member/memberList";
    }
    
    // 관리자 회원 상세
    @GetMapping("detail.do")	// board/detail.do?bno=1
    public String getBoardDetail(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/memberDetail";
    }
    
    // 마이페이지
    @GetMapping("mypage.do")
    public String mypage(Model model) throws Exception {
//        String id = (String) session.getAttribute("sid");
        String id = "admin";
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/mypage";
    }

    //회원 가입 - 약관 동의 페이지 로딩
    @GetMapping("term.do")
    public String getAgree(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        return "/member/term";
    }
    //회원 가입 - 회원가입폼 페이지 로딩
    @GetMapping("join.do")
    public String getJoin(Model model) throws Exception {
        return "/member/memberInsert";
    }
    //회원 가입 - Ajax로 아이디 중복 체크
    @RequestMapping(value="idCheck.do", method=RequestMethod.POST)
    public void idCheck(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {

    }

    //회원 가입 - 회원 가입 처리
    @RequestMapping(value="insert.do", method = RequestMethod.POST)
    public String memberWrite(Member member, Model model) throws Exception {
        return "redirect:/";
    }

    //로그인 폼 로딩
    @RequestMapping("login.do")
    public String memberLoginForm(Model model) throws Exception {
        return "/member/loginForm";
    }

    @RequestMapping(value = "signin.do" , method=RequestMethod.POST)
    public String signIn(HttpServletResponse response, HttpServletRequest request,Model model) throws Exception {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        boolean check = memberService.loginCheck(id, pw);
        if(check) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 성공');</script>");
            out.flush();
            session.setAttribute("sid", id);
            return "/index";
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 실패');</script>");
            out.flush();
            return "/member/loginForm";
        }
    }

    @GetMapping("logout.do")
    public String logout(HttpServletResponse response, HttpServletRequest request,Model model) throws Exception {
        HttpSession session = request.getSession();
        session.invalidate();
        return "/index";
    }

}
