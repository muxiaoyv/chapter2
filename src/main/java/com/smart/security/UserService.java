package com.smart.security;

import com.smart.dao.UserDao;
import com.smart.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.List;

public class UserService implements UserDetailsService {
    private UserDao userDao;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.findUserByUserName(username);
        if (user==null)
            throw new UsernameNotFoundException("找不到该账户信息！");
        List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
        getRoles(user,list);
        org.springframework.security.core.userdetails.UserDetails auth_user = new
                org.springframework.security.core.userdetails.User(username,user.getPassword(),list);
        return auth_user;
    }

    public void getRoles(User user,List<GrantedAuthority> list){
        list.add(new SimpleGrantedAuthority("ROLE_"+user.getRoles()));
        for (int i = 0; i<3; i++ ) {
            int p = (user.getPermissions()>>i)&1;
            String permission = "";
            switch (i){
                case 0:
                    permission = "CAN_READ";
                    break;
                case 1:
                    permission = "CAN_WRITE";
                    break;
                case 2:
                    permission = "CAN_DELETE";
                    break;
            }
            if (p == 1) {
                list.add(new SimpleGrantedAuthority("ROLE_" + permission));
            }
        }
    }
}
