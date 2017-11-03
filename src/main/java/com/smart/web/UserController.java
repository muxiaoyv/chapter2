package com.smart.web;

import com.smart.domain.User;
import com.smart.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public @ResponseBody
    List<User> getResponses() {
        return userService.getUsers();
    }

    @RequestMapping(value = "/users", method = RequestMethod.PUT)
    public
    void modifyUserPermissions(@RequestBody UserModel userModel) {
        userService.modifyUserPermissions(userModel.getPermissions(),userModel.getUserId());
    }

    @RequestMapping(value = "/user/password", method = RequestMethod.PUT)
    public boolean modifyUserPassword(@RequestBody UserModel userModel) {
        return userService.modifyUserPassword(userModel.getPassword(),userModel.getNewPassword(),userModel.getUserId(),userModel.getUserName());
    }


}
