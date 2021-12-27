package cn.coderliu.granter;

import cn.coderliu.token.MobileAndVerificationCodeAuthenticationToken;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.common.exceptions.InvalidGrantException;
import org.springframework.security.oauth2.provider.*;
import org.springframework.security.oauth2.provider.token.AbstractTokenGranter;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @ClassName: MobileAndVerificationCodeTokenGranter
 * @Description: 手机号+验证码授权类型
 * @Author: liu
 * @Date: 2020/9/10 4:43 下午
 * @Version: V1.0
 **/
public class MobileAndVerificationCodeTokenGranter extends AbstractTokenGranter {

    private static final String GRANT_TYPE = "mobile_sms";

    private final AuthenticationManager authenticationManager;

    public MobileAndVerificationCodeTokenGranter(AuthenticationManager authenticationManager, AuthorizationServerTokenServices tokenServices
            , ClientDetailsService clientDetailsService, OAuth2RequestFactory requestFactory) {
        super(tokenServices, clientDetailsService, requestFactory, GRANT_TYPE);
        this.authenticationManager = authenticationManager;
    }

    @Override
    protected OAuth2Authentication getOAuth2Authentication(ClientDetails client, TokenRequest tokenRequest) {
        Map<String, String> parameters = new LinkedHashMap<>(tokenRequest.getRequestParameters());
        // 电话号码与验证码
        String mobile = parameters.get("mobile");
        String verificationCode = parameters.get("verification_code");
        String clientId = parameters.get("client_id");

        Authentication userAuth = new MobileAndVerificationCodeAuthenticationToken(mobile, verificationCode, clientId);
        ((AbstractAuthenticationToken) userAuth).setDetails(parameters);
        // authenticationManager进行验证
        userAuth = authenticationManager.authenticate(userAuth);
        if (userAuth == null || !userAuth.isAuthenticated()) {
            throw new InvalidGrantException("Could not authenticate phone number: " + mobile);
        }
        OAuth2Request storedOAuth2Request = getRequestFactory().createOAuth2Request(client, tokenRequest);
        return new OAuth2Authentication(storedOAuth2Request, userAuth);
    }
}
