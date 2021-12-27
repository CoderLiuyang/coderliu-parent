package cn.coderliu.mobile;

import cn.coderliu.model.LoginAppUser;
import cn.coderliu.service.FeihuangUserDetailsService;
import cn.coderliu.token.DeviceAuthenticationToken;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

/**
 * @ClassName: DeviceAuthenticationProvider
 * @Description: 设备信息登陆校验逻辑
 * @Author: liu
 * @Date: 2020/9/8 2:27 下午
 * @Version: V1.0
 **/
@Slf4j
@Setter
public class DeviceAuthenticationProvider implements AuthenticationProvider {

    private FeihuangUserDetailsService userDetailsService;
    private RedisTemplate<String, Object> redisTemplate;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        DeviceAuthenticationToken authenticationToken = (DeviceAuthenticationToken) authentication;
        // 设备信息认证
        String uniqueId = (String) authenticationToken.getPrincipal();
        String clientId = (String) authenticationToken.getCredentials();
        String apkCommentJson = authenticationToken.getApkCommentJson();
        log.info("按设备信息认证uniqueId: {}", uniqueId);
        log.info("按设备信息认证clientId: {}", clientId);
        log.info("按设备信息认证apkCommentJson: {}", apkCommentJson);
        LoginAppUser user = userDetailsService.loadUserByUniqueId(uniqueId, clientId, apkCommentJson);
        if (user == null) {
            throw new InternalAuthenticationServiceException("手机号错误");
        }
        DeviceAuthenticationToken authenticationResult = new DeviceAuthenticationToken(user, clientId, apkCommentJson, user.getAuthorities());
        return authenticationResult;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return DeviceAuthenticationToken.class.isAssignableFrom(authentication);
    }
}
