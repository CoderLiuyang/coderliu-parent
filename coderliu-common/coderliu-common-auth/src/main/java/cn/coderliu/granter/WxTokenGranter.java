package cn.coderliu.granter;

import cn.coderliu.token.WxAuthenticationToken;
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
public class WxTokenGranter extends AbstractTokenGranter {

    private static final String GRANT_TYPE = "wx";

    private final AuthenticationManager authenticationManager;

    public WxTokenGranter(AuthenticationManager authenticationManager, AuthorizationServerTokenServices tokenServices
            , ClientDetailsService clientDetailsService, OAuth2RequestFactory requestFactory) {
        super(tokenServices, clientDetailsService, requestFactory, GRANT_TYPE);
        this.authenticationManager = authenticationManager;
    }

    @Override
    protected OAuth2Authentication getOAuth2Authentication(ClientDetails client, TokenRequest tokenRequest) {
        Map<String, String> parameters = new LinkedHashMap<>(tokenRequest.getRequestParameters());
        // 微信code与appId
        String code = parameters.get("code");
        String clientId = parameters.get("client_id");
        int type = Integer.valueOf(parameters.get("type"));
        String uuid = parameters.get("uuid");
        Authentication userAuth = new WxAuthenticationToken(code, clientId, type, uuid);
        ((AbstractAuthenticationToken) userAuth).setDetails(parameters);
        // authenticationManager进行验证
        userAuth = authenticationManager.authenticate(userAuth);
        if (userAuth == null || !userAuth.isAuthenticated()) {
            throw new InvalidGrantException("Could not authenticate wx code: " + code);
        }
        OAuth2Request storedOAuth2Request = getRequestFactory().createOAuth2Request(client, tokenRequest);
        return new OAuth2Authentication(storedOAuth2Request, userAuth);
    }
}
