package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Cart;
import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.service.CartServiceImpl;
import kr.ed.haebeop.service.InstServiceImpl;
import kr.ed.haebeop.service.LectureServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart/*")
public class CartController {
    @Autowired
    private CartServiceImpl cartService;
    @Autowired
    private LectureServiceImpl lectureService;
    @Autowired
    private InstServiceImpl instService;
    @Autowired
    HttpSession session;

    @GetMapping("cartList.do")
    public String cartList(HttpServletRequest req, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        
        // 장바구니에 들어있는 개수
        int cartCnt = cartService.cartCnt(id);
        // 해당 id의 장바구니 목록
        List<Cart> cartList = cartService.cartList(id);
        // 강의 제목, 과목, 강사이름 추출
        List<Lecture> lectureList = new ArrayList<>();
        List<Instructor> instList = new ArrayList<>();
        for (int i=0; i<cartList.size(); i++) {
            Lecture lecture = lectureService.getLecture(cartList.get(i).getLec_no());
            Instructor instructor = instService.getInstructorName(lecture.getIno());
            lectureList.add(lecture);
            instList.add(instructor);
        }

        model.addAttribute("cartCnt", cartCnt);
        model.addAttribute("cartList", cartList);
        model.addAttribute("lecList", lectureList);
        model.addAttribute("instList", instList);
        return "/cart/cartList";
    }

    @GetMapping("cartInsert.do")
    public String cartInsert(@RequestParam int lec_no, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        System.out.println(id);
        System.out.println(lec_no);
        Cart cart = new Cart();
        cart.setId(id);
        cart.setLec_no(lec_no);
        int check = cartService.getCartCheck(cart);
        System.out.println(check);
        if(check == 0) {
            cartService.cartInsert(cart);
        }
        System.out.println(cart.toString());

        return "redirect:/cart/cartList.do";
    }
}
