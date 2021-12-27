package cn.coderliu.mobile;

import cn.coderliu.constants.SecurityConstants;
import cn.coderliu.enums.SmsEnums;
import cn.coderliu.model.LoginAppUser;
import cn.coderliu.service.FeihuangUserDetailsService;
import cn.coderliu.token.MobileAndVerificationCodeAuthenticationToken;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

/**
 * @ClassName: MobileAndVerificationCodeAuthenticationProvider
 * @Description: 手机号验证码登陆校验逻辑
 * @Author: liu
 * @Date: 2020/9/8 2:27 下午
 * @Version: V1.0
 **/
@Slf4j
@Setter
public class MobileAndVerificationCodeAuthenticationProvider implements AuthenticationProvider {

    private FeihuangUserDetailsService userDetailsService;
    private RedisTemplate<String, Object> redisTemplate;


    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        MobileAndVerificationCodeAuthenticationToken authenticationToken = (MobileAndVerificationCodeAuthenticationToken) authentication;
        String mobile = (String) authenticationToken.getPrincipal();
        String verificationCode = (String) authenticationToken.getCredentials();
        String clientId = (String) authenticationToken.getClientId();
        // 验证码校验
        String redisKey = SecurityConstants.REDIS_PHONE_VERIFY
                .concat(mobile)
                .concat("_").concat(clientId)
                .concat("_").concat(SmsEnums.AUTH.getCode());

        if (!redisTemplate.hasKey(redisKey)) {
            throw new InternalAuthenticationServiceException("验证码错误");
        }
        String v = redisTemplate.opsForValue().get(redisKey).toString();
        if (!verificationCode.equals(v)) {
            throw new InternalAuthenticationServiceException("验证码错误");
        }
        redisTemplate.delete(redisKey);
        LoginAppUser user = userDetailsService.loadUserByMobile(mobile, clientId);
        if (user == null) {
            throw new InternalAuthenticationServiceException("手机号错误");
        }
        MobileAndVerificationCodeAuthenticationToken authenticationResult = new MobileAndVerificationCodeAuthenticationToken(user, verificationCode, clientId, user.getAuthorities());
        return authenticationResult;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return MobileAndVerificationCodeAuthenticationToken.class.isAssignableFrom(authentication);
    }
}
