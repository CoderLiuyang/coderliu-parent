package cn.coderliu.support.sms;

import cn.coderliu.support.base.OAuth2ResourceOwnerBaseAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.AuthorizationGrantType;

import java.util.Map;
import java.util.Set;

/**
 * @description 短信登录token信息
 */
public class OAuth2ResourceOwnerSmsAuthenticationToken extends OAuth2ResourceOwnerBaseAuthenticationToken {

	public OAuth2ResourceOwnerSmsAuthenticationToken(AuthorizationGrantType authorizationGrantType,
			Authentication clientPrincipal, Set<String> scopes, Map<String, Object> additionalParameters) {
		super(authorizationGrantType, clientPrincipal, scopes, additionalParameters);
	}

}
