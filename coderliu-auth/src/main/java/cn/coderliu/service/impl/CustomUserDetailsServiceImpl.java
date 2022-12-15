package cn.coderliu.service.impl;

import cn.coderliu.model.LoginUser;
import cn.coderliu.service.CustomUserDetailsService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsServiceImpl implements CustomUserDetailsService {


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return null;
    }



    @Override
    public LoginUser loadUserByWebApp(String username, String password) {
        return null;
    }
}
