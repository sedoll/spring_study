package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Check;
import kr.ed.haebeop.domain.CheckVO;
import kr.ed.haebeop.test.CheckValidator;
import kr.ed.haebeop.test.CheckValidator2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/check/")
public class CheckController {

    @GetMapping("check1")   //http://localhost:8084/check/check1 GET
    public String check1(Model model) {
        return "/check/check1";
    }
    @PostMapping("check1") //http://localhost:8084/check/check1 POST
    public String check1Pro(@RequestParam String id, @RequestParam String pw, Model model){
        model.addAttribute("id", id);
        model.addAttribute("pw", pw);
        return "/check/check1_result";
    }

    @GetMapping("check2")   //http://localhost:8084/check/check2 GET
    public String check2(Model model) {
        return "/check/check2";
    }

    @PostMapping("check2") //http://localhost:8084/check/check1 POST
    public String check2Pro(HttpServletRequest req, Model model){
        model.addAttribute("id", req.getParameter("id"));
        model.addAttribute("pw", req.getParameter("pw"));
        return "/check/check2_result";
    }

    @GetMapping("check3")   //http://localhost:8084/check/check3 GET
    public String check3(Model model) {
        return "/check/check3";
    }

    @GetMapping("check3pro") //http://localhost:8084/check/check3 POST
    public String check3Pro(HttpServletRequest req, Model model){
        model.addAttribute("id", req.getParameter("id"));
        model.addAttribute("pw", req.getParameter("pw"));
        return "/check/check3_result";
    }

    // 하나의 컨트롤러에서는 오로지 하나의 Vailidator만을 쓸 수 밖에 없다는 단점이 있음
    // 근데 ModelAttribute 이름을 지정해주면 여러개에서 사용이 가능, 근데 나중에 에러 터질 수 있으니 컨트롤러에는 하나에서 작성
    // check4, 5를 테스트 하고 싶으면 CheckValidator()
    // check6 을 테스트 하고 싶으면 CheckValidator2() 사용

    // check4, 5에 대한 Validator
    @InitBinder("check")
    protected void initBinderForCheck(WebDataBinder binder){
        binder.setValidator(new CheckValidator());
    }

    // check6에 대한 Validator
    @InitBinder("chk")
    protected void initBinderForChk(WebDataBinder binder){
        binder.setValidator(new CheckValidator2());
    }

    @GetMapping("check4")   //http://localhost:8084/check/check4 GET
    public String check4(Model model) {
        return "/check/check4";
    }

    @PostMapping("check4pro") //http://localhost:8084/check/check4 POST
    public String check4Pro(@ModelAttribute("check") Check check, Model model, BindingResult result){
        String page = "/check/check4_result";   //폼의 유효성 검증시 알맞은 데이터이면
        CheckValidator ckVal = new CheckValidator();
        ckVal.validate(check, result);
        if(result.hasErrors()){//폼의 유효성 검증시 에러가 있으면, 에러페이지로 변경
            page = "/check/error4";
        }
        return page;
    }

    @GetMapping("check5")   //http://localhost:8084/check/check4 GET
    public String check5(Model model) {
        return "/check/check5";
    }

    @PostMapping("check5pro")
    public String check5Pro(@ModelAttribute("check") @Valid Check check, Model model, BindingResult result){
        String page = "/check/check5_result";   //폼의 유효성 검증시 알맞은 데이터이면
        if(result.hasErrors()){//폼의 유효성 검증시 에러가 있으면, 에러페이지로 변경
            page = "/check/error5";
        }
        return page;
    }

    @GetMapping("check6")
    public String check6(@ModelAttribute("chk") CheckVO chk, Model model) {
        model.addAttribute("chk", chk);
        return "/check/check6";
    }

    @PostMapping("check6")
    public String check6Pro(@ModelAttribute("chk") @Valid CheckVO chk, BindingResult result, Model model){
        String page = "/check/check6";
        model.addAttribute("chk", chk);
        return page;
    }

    /*
    @RequestMapping("check6")
    public String check6(@ModelAttribute("chk") @Valid CheckVO chk, BindingResult result, Model model) {
        model.addAttribute("chk", chk);
        return "/check/check6";
    }
     */
}
