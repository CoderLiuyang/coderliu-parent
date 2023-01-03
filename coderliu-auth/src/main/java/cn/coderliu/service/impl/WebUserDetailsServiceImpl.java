package cn.coderliu.service.impl;

import cn.coderliu.admin.feign.AdminFeignService;
import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.constants.SecurityConstants;
import cn.coderliu.model.LoginUser;
import cn.coderliu.model.LoginUserRole;
import cn.coderliu.service.CustomUserDetailsService;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ArrayUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.*;

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
            user.getRoles().forEach(role -> dbAuthsSet.add(SecurityConstants.ROLE + role.getId()));
            // 获取资源
            dbAuthsSet.addAll(user.getPermissions());
        }
        //构建认证对象
        Collection<GrantedAuthority> authorities = AuthorityUtils
                .createAuthorityList(dbAuthsSet.toArray(new String[0]));
        final List<LoginUserRole> roles = Convert.toList(LoginUserRole.class, user.getRoles());
        return new LoginUser(user.getId(), user.getDeptId(), username,
                SecurityConstants.BCRYPT + user.getPassWord(),
                user.getPhone(), true, roles, true, true, true,
                user.getStatus() == 1, authorities);
    }


    public boolean support(String clientId, String grantType) {
        return SecurityConstants.WEB.equals(clientId);
    }


}
