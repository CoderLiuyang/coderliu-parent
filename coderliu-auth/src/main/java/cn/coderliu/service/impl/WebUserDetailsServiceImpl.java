package cn.coderliu.service.impl;

import cn.coderliu.admin.feign.AdminFeignService;
import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.common.R;
import cn.coderliu.constants.SecurityConstants;
import cn.coderliu.model.LoginUser;
import cn.coderliu.service.CustomUserDetailsService;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class WebUserDetailsServiceImpl implements CustomUserDetailsService {


    private final AdminFeignService adminFeignService;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        GetUserDetailVo user = adminFeignService.getUserDetail(username).getData();
        if (user == null) {
            throw new UsernameNotFoundException("用户不存在");
        }
        Set<String> dbAuthsSet = new HashSet<>();
        if (ArrayUtil.isNotEmpty(user.getRoles())) {
            user.getRoles().forEach(role -> dbAuthsSet.add(SecurityConstants.ROLE + role));
            // 获取资源
            dbAuthsSet.addAll(user.getPermissions());
        }
        //构建认证对象
        Collection<GrantedAuthority> authorities = AuthorityUtils
                .createAuthorityList(dbAuthsSet.toArray(new String[0]));
        return new LoginUser("", "", "", "", "", true, true, true,
                true, authorities);
    }


    public boolean support(String clientId, String grantType) {
        return SecurityConstants.WEB.equals(grantType);
    }


}
