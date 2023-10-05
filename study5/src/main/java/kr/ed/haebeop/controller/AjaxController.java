package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Human;
import kr.ed.haebeop.domain.TestVO;
import kr.ed.haebeop.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/ajax")
public class AjaxController {

    @Autowired
    private TestService testService3;

    @GetMapping("/")
    public String ajaxHome() {
        return "/ajax/home";
    }

    @GetMapping("/test1")
    public String ajaxTest1() {
        return "/ajax/test1";
    }

    @GetMapping("test1pro")
    public String ajaxTest1Pro() {
        System.out.println("Get 전송 테스트");
        return "/ajax/test1";
    }

    @GetMapping("/test2")
    public String ajaxTest2() { return "/ajax/test2"; }

    @PostMapping("/test2pro")
    public String ajaxTest2Pro() {
        System.out.println("Post 전송 테스트");
        return "/ajax/test2";
    }

    @GetMapping("/test5")
    public String ajaxTest5() { return "/ajax/test5"; }

    @GetMapping("/test5pro")
    @ResponseBody
    public Human ajaxTest5Pro(@ModelAttribute("human") Human human) {
        System.out.println(human.toString());
        return human;
    }

    @GetMapping("/test6")
    public String ajaxTest6() { return "/ajax/test6"; }

    @PostMapping("/test6pro")
    @ResponseBody
    public Human ajaxTest6Pro(@ModelAttribute("human") Human human) {
        System.out.println(human.toString());
        return human;
    }

    @GetMapping("/test7")
    public String ajaxTest7() {return "/ajax/test7"; }

    @PostMapping("/test7pro")
    @ResponseBody
    public Human ajaxTest7Pro(@RequestBody Human human) {
        System.out.println(human.toString());
        return human;
    }

    @GetMapping("/test8")
    public String ajaxTest8() { return "/ajax/test8"; }

    @PostMapping("/test8pro")
    @ResponseBody
    public List<TestVO> ajaxTest8Pro(@RequestBody TestVO test) throws Exception {
        System.out.println(test.toString());
        testService3.testInsert(test);
        List<TestVO> tList = testService3.testList();
        return tList;
    }
}
