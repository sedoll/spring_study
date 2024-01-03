package com.spring02.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// 메인페이지 이동
@Controller
public class HomeCtrl {
    // http:localhost:8081/pro03_war -> / -> /WEB-INF/views/index.jsp
    @GetMapping("/")
    public String home() {
        return "/index";
    }
}