package com.smart.web;

import com.smart.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
public class RegisterController {
    @Autowired
    RegisterService registerService;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public @ResponseBody void register(UserModel user, HttpServletResponse response) throws IOException {
        if(user.getUserName()==null || user.getPassword() == null || registerService.isUserExist(user.getUserName()))
            response.sendRedirect("/css/failed.html");
        registerService.register(user.getUserName(), user.getPassword(), user.getEmail());
        response.sendRedirect("/");
    }

    @RequestMapping(value = "/register/{username}", method = RequestMethod.GET)
    public @ResponseBody Boolean isUserExist(@PathVariable String username) {
        return registerService.isUserExist(username);
    }
}
