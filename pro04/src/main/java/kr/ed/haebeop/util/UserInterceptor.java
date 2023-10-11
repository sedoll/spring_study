package kr.ed.haebeop.util;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserInterceptor extends HandlerInterceptorAdapter {

    // 호출되기 전에 사전 작업
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean flag = false;
        HttpSession session = request.getSession(false); // 자동 로그인 방지
        if(session.getAttribute("user")!=null && session !=null) {
            flag = true;
            System.out.println("** 인터셉터 통과 , 요청 주소 **"+request.getRequestURI());
        } else {
            flag = false;
            System.out.println("** 인터셉터 실패 **"+request.getRequestURI());
            response.sendRedirect(request.getContextPath()+"/member/login.do");
        }
        return flag;
    }
}
