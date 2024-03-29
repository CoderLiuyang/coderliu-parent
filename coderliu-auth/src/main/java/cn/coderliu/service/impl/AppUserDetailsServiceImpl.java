package cn.coderliu.service.impl;

import cn.coderliu.constants.SecurityConstants;
import cn.coderliu.service.CustomUserDetailsService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AppUserDetailsServiceImpl implements CustomUserDetailsService {


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return null;
    }
    public boolean support(String clientId, String grantType) {
        return SecurityConstants.APP.equals(grantType);
    }


}
