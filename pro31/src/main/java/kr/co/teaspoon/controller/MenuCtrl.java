package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Infomation;
import kr.co.teaspoon.service.MemberService;
import kr.co.teaspoon.service.MenuService;
import kr.co.teaspoon.util.Week;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/menu/*")
public class MenuCtrl {

    @Autowired
    private MenuService menuService;

    @Autowired
    HttpSession session; // 세션 생성

    @GetMapping("list.do")		//info/list.do
    public String getinfoList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

        String schoolName = request.getParameter("name");
        List<String> ddishList = new ArrayList<>(); // 식단
        List<String> mlsvList = new ArrayList<>(); // 날짜

        Week week = new Week();

        List<String> date = week.getDate();

        Map<String, Integer> map = new HashMap<>();
        map.put("경인고", 7010563);
        map.put("고척중", 7041168);
        map.put("신구로초", 7041136);

        int minValue = 1;
        int maxValue = 50;

        Map<String, String> resultList = menuService.getMenu(map, date, schoolName, minValue, maxValue );

        for (Map.Entry<String, String> entry : resultList.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();

            ddishList.add(key);
            mlsvList.add(value);
        }
        model.addAttribute("ddishList", ddishList);
        model.addAttribute("mlsvList", mlsvList);
        return "/menu/menuList";
    }
}
