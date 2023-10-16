package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.InstService;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.MemberServiceImpl;
import kr.ed.haebeop.service.PaymentService;
import kr.ed.haebeop.util.DateCalculator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

// 강의 신청, 구매

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
    @Autowired
    private LectureService lectureService;
    @Autowired
    private MemberServiceImpl memberService;
    @Autowired
    private InstService instService;
    @Autowired
    private PaymentService paymentService;
    @Autowired
    HttpSession session; // 세션 생성
    
    // 강의 등록 폼
    @GetMapping("addPayment.do")
    public String addPayment(@RequestParam int lec_no, HttpServletRequest req, Model model) throws Exception {
        // 강의 정보
        Lecture lecture = lectureService.getLecture(lec_no);
        
        // 선생님 정보
        Instructor instructor = instService.getInstructorName(lecture.getIno());
        // 회원 정보
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("sid");
        Member member = new Member();
        member = memberService.getMember(id);

        model.addAttribute("pro", lecture);
        model.addAttribute("inst", instructor);
        model.addAttribute("member", member);
        
        return "/payment/addPayment";
    }
    
    // 강의 결제
    @PostMapping("addPayment.do")
    public String addPaymentPro(@ModelAttribute Payment payment, Model model) throws Exception {
        paymentService.paymentInsert(payment);
        return "redirect:/";
    }

    // 결제 목록
    @GetMapping("paymentList.do")
    public String paymentList(Model model) throws Exception{
        String id = (String) session.getAttribute("sid");
        List<Payment> payList =  paymentService.paymentMemList(id);
        model.addAttribute("payList", payList);
        return "/member/myPage/paymentList";
    }
    
    // 강의 구매 확정
    @GetMapping("buyPayment.do")
    public String buyPayment(HttpServletRequest req, Model model) throws Exception {
        int sno = Integer.parseInt(req.getParameter("sno"));
        int lec_no = Integer.parseInt(req.getParameter("lno"));

        Member member = new Member();
        String id = (String) session.getAttribute("sid");
        int pt = (int) Double.parseDouble(req.getParameter("pt"));
        member.setId(id);
        member.setPt(pt);
        paymentService.buyPayemnt(sno);
        lectureService.countUpLec(lec_no); // 수강 인원 현황 +1
        memberService.memberPoint(member);
        return "redirect:/payment/paymentList.do";
    }
    
    // 환불, 취소
    @GetMapping("returnPayment.do")
    public String returnPayment(@RequestParam int sno) throws Exception{
        paymentService.paymentDelete(sno);
        return "redirect:/payment/paymentList.do";
    }

}
