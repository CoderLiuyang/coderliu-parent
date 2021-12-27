package cn.coderliu.mobile;

import cn.coderliu.model.LoginAppUser;
import cn.coderliu.service.FeihuangUserDetailsService;
import cn.coderliu.token.WxAuthenticationToken;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

/**
 * @ClassName: WxAuthenticationProvider
 * @Description: 微信登陆校验逻辑
 * @Author: liu
 * @Date: 2020/9/8 2:27 下午
 * @Version: V1.0
 **/
@Slf4j
@Setter
public class WxAuthenticationProvider implements AuthenticationProvider {

    private FeihuangUserDetailsService userDetailsService;
    private RedisTemplate<String, Object> redisTemplate;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        WxAuthenticationToken authenticationToken = (WxAuthenticationToken) authentication;
        String code = (String) authenticationToken.getPrincipal();
        String clientId = (String) authenticationToken.getCredentials();
        int type = authenticationToken.getType();
        String uuid = authenticationToken.getUuid();
        log.info("微信认证code: {}", code);
        log.info("微信认证clientId: {}", clientId);
        log.info("微信认证type: {}", type);
        log.info("微信认证uuid: {}", uuid);
        LoginAppUser user = userDetailsService.loadUserByWXCode(code, clientId, type, uuid);
        if (user == null) {
            throw new InternalAuthenticationServiceException("微信授权失败");
        }
        WxAuthenticationToken authenticationResult = new WxAuthenticationToken(user, clientId, type, uuid, user.getAuthorities());
        return authenticationResult;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return WxAuthenticationToken.class.isAssignableFrom(authentication);
    }
}
