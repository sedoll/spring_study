package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.CheckVO;
import kr.ed.haebeop.test.CheckValidator2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/check6/")
public class Check6Ctrl {

    @InitBinder
    protected void initBinder(WebDataBinder binder){
        binder.setValidator(new CheckValidator2());
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
