package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Cart;
import kr.ed.haebeop.service.CartServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart/*")
public class CartController {
    @Autowired
    private CartServiceImpl cartService;
    @Autowired
    HttpSession session;

    @GetMapping("cartList.do")
    public String cartList(HttpServletRequest req, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        
        // 장바구니에 들어있는 개수
        int cartCnt = cartService.cartCnt(id);
        // 해당 id의 장바구니 목록
        List<Cart> cartList = cartService.cartList(id);

        model.addAttribute("cartCnt", cartCnt);
        model.addAttribute("cartList", cartList);
        return "/cart/cartList";
    }

    @GetMapping("cartInsert.do")
    public String cartInsert(HttpServletRequest req, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        int lec_no = Integer.parseInt(req.getParameter("lec_no"));
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

        return "redirect:/";
    }
}
