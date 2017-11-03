package com.smart.service;

import com.smart.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterService {
    @Autowired
    private UserDao userDao;

    public boolean isUserExist(String userName) {
        int matchCount =userDao.isUserExist(userName);
        return matchCount > 0;
    }


    public void register(String userName, String password ,String email) {
        userDao.register(userName, password ,email) ;
    }
}
