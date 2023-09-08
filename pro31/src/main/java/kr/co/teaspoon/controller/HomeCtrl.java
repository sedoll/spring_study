package kr.co.teaspoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

// 메인페이지 이동
@Controller
public class HomeCtrl {
    // http:localhost:8081/pro03_war -> / -> /WEB-INF/views/index.jsp
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Locale locale, Model model) {
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        String today = dateFormat.format(date);
        model.addAttribute("today", today);
        model.addAttribute("myName", "홍길동");
        return "/index";
    }
}
