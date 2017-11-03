package com.smart.web;

import com.smart.domain.User;
import com.smart.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@RestController
public class LoginController implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userService;

    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        System.out.print("1");
        User user = userService.findUserByUserName(request.getParameter("j_username"));
        user.setLastIp(request.getLocalAddr());
        user.setLastVisit(new Date());
        userService.loginSuccess(user);
        request.getSession().setAttribute("user", user);
        response.addCookie(new Cookie("userName",user.getUserName()));
        response.addCookie(new Cookie("userId",String.valueOf(user.getUserId())));
        response.addCookie(new Cookie("lastVisit", String.valueOf(user.getLastVisit())));
        response.addCookie(new Cookie("email",user.getEmail()));
        response.addCookie(new Cookie("auth",authentication.getAuthorities().toString()));
        response.sendRedirect("/");
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}

