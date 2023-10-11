package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Product;
import kr.ed.haebeop.service.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product/*")
public class ProductController {

    @Resource(name="uploadPath")
    String uploadPath;

    @Autowired
    private ProductServiceImpl productService;

    @RequestMapping(value = "/addProductForm", method = RequestMethod.GET)
    public String addProductForm(Model model) {
        String msg = "관리자의 상품 등록폼이 로딩되었습니다.";
        model.addAttribute("msg", msg);
        return "admin/addProduct";
    }

    @PostMapping("/addProduct")
    public String addProduct(HttpServletRequest req, Model model) {
        MultipartHttpServletRequest files = (MultipartHttpServletRequest) req;

        // 파일 처리
        MultipartFile imgSrc1 = files.getFile("imgSrc1");
        MultipartFile imgSrc2 = files.getFile("imgSrc2");
        MultipartFile imgSrc3 = files.getFile("imgSrc3");

        // 다른 폼 필드 처리
        Product product = new Product();
        product.setCate(files.getParameter("cate"));
        product.setPname(files.getParameter("pname"));
        product.setPcomment(files.getParameter("pcomment"));
        product.setPlist(files.getParameter("plist"));
        product.setPrice(Integer.parseInt(files.getParameter("price")));

        if (!imgSrc1.isEmpty()) {
            product.setImgSrc1(imgSrc1.getOriginalFilename());
        }
        if (!imgSrc2.isEmpty()) {
            product.setImgSrc2(imgSrc2.getOriginalFilename());
        }
        if (!imgSrc3.isEmpty()) {
            product.setImgSrc3(imgSrc3.getOriginalFilename());
        }

        productService.addProduct(product);

        // 파일 저장
        String uploadDir = "D:/spring_study/pro04/src/main/webapp/resources/upload/";

        try {
            if (!imgSrc1.isEmpty()) {
                imgSrc1.transferTo(new File(uploadDir + imgSrc1.getOriginalFilename()));
            }
            if (!imgSrc2.isEmpty()) {
                imgSrc2.transferTo(new File(uploadDir + imgSrc2.getOriginalFilename()));
            }
            if (!imgSrc3.isEmpty()) {
                imgSrc3.transferTo(new File(uploadDir + imgSrc3.getOriginalFilename()));
            }
        } catch (IOException e) {
            e.printStackTrace(); // 오류 처리
        }

        return "redirect:/product/proList";
    }

    @RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
    public String deleteProduct(@RequestParam("no") int no) {
        productService.delProduct(no); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        return "redirect:/product/proList";
    }

    @RequestMapping(value = "/likeProduct", method = RequestMethod.GET)
    public String likeProduct(Model model, @RequestParam("pno") String pno, @RequestParam("sid") String sid) {
        return "redirect:/product/getProduct?no=" + pno;
    }

    @RequestMapping(value = "/getProduct", method = RequestMethod.GET)
    public String getProduct(Model model, @RequestParam("no") int no) {
        Product product = productService.getProduct(no); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        model.addAttribute("product", product);
        return "product/getProduct";
    }

    @RequestMapping(value = "/updateProductForm", method = RequestMethod.GET)
    public String updateProductForm(Model model, @RequestParam("no") int no) {
        Product product = productService.getProduct(no); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        model.addAttribute("product", product);
        return "admin/updateProduct";
    }

    @RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
    public String updateProduct(Model model, @ModelAttribute Product product) {
        productService.updateProduct(product); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        return "redirect:/product/getProduct?no=" + product.getNo();
    }

    @RequestMapping(value = "/proList", method = RequestMethod.GET)
    public String proList(Model model) {
        List<Product> productList = productService.getProductList(); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        model.addAttribute("proList", productList);
        return "product/proList";
    }
}
