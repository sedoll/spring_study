package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
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
    private CartServiceImpl cartService;
    @Autowired
    HttpSession session; // 세션 생성
    
    // 결제 폼
    @GetMapping("addPayment.do")
    public String addPayment(@RequestParam int lec_no, HttpServletRequest req, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        Payment payment = new Payment();
        payment.setId(id);
        payment.setLec_no(lec_no);
        int check1 = paymentService.checkPayment(payment); // 결제 내역에 있는지 확인
        if(check1 == 0) {
            // 강의 정보
            Lecture lecture = lectureService.getLecture(lec_no);
            // 선생님 정보
            Instructor instructor = instService.getInstructorName(lecture.getIno());
            // 회원 정보
            Member member = memberService.getMember(id);

            model.addAttribute("pro", lecture);
            model.addAttribute("inst", instructor);
            model.addAttribute("member", member);

            return "/payment/addPayment";
        } else {
            
            return "redirect:/";
        }
    }
    
    // 강의 결제
    @PostMapping("addPayment.do")
    public String addPaymentPro(@ModelAttribute Payment payment, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        payment.setId(id);
        paymentService.paymentInsert(payment); // 결제 내역 추가
        Member member = memberService.getMember(id); // 결제한 회원정보 추출
        member.setPt(payment.getPt()); // 포인트
        memberService.memberPointSub(member); // 사용한 포인트 차감

        Cart cart = new Cart();
        cart.setLec_no(payment.getLec_no());
        cart.setId(payment.getId());
        
        // 카트에 있으면 제거
        try {
            int cartno = cartService.getCart(cart);
            cartService.cartDelete(cartno);
        } catch (Exception e) {

        }

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
        // 사용한 포인트 반환
        Payment payment = paymentService.getPayment(sno);
        Member member = memberService.getMember(payment.getId());
        member.setPt(payment.getPt());
        memberService.memberPoint(member);

        paymentService.paymentDelete(sno);

        return "redirect:/payment/paymentList.do";
    }

}
