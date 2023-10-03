package kr.ed.haebeop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

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
}
