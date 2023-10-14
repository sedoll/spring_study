package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.service.InstServiceImpl;
import kr.ed.haebeop.service.LectureServiceImpl;
import kr.ed.haebeop.service.MemberServiceImpl;
import kr.ed.haebeop.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

// 강의 신청, 구매

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
    @Autowired
    private LectureServiceImpl lectureService;
    @Autowired
    private MemberServiceImpl memberService;
    @Autowired
    private InstServiceImpl instService;
    @Autowired
    private PaymentService paymentService;

    @GetMapping("addPayment.do")
    public String addPayment(@RequestParam int lec_no, HttpServletRequest req, Model model) throws Exception {
        // 강의 정보
        Lecture lecture = new Lecture();
        lecture = lectureService.getLecture(lec_no);
        
        // 선생님 정보
        Instructor instructor = new Instructor();
        instructor = instService.getInstructorName(lecture.getIno());
        
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

    @PostMapping("addPayment.do")
    public String addPaymentPro(@ModelAttribute Payment payment, Model model) {
        paymentService.paymentInsert(payment);
        lectureService.countUp(payment.getLec_no());
        return "redirect:/";
    }

}
