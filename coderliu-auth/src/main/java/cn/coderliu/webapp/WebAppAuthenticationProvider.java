package cn.coderliu.webapp;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.core.OAuth2Token;
import org.springframework.security.oauth2.server.authorization.OAuth2AuthorizationService;
import org.springframework.security.oauth2.server.authorization.token.OAuth2TokenGenerator;

import java.util.Map;

/**
 * webapp认证提供者
 */
public class WebAppAuthenticationProvider implements AuthenticationProvider {

    private final AuthenticationManager authenticationManager;

    private final OAuth2AuthorizationService authorizationService;


    private final OAuth2TokenGenerator<? extends OAuth2Token> tokenGenerator;

    public WebAppAuthenticationProvider(AuthenticationManager authenticationManager,
                                        OAuth2AuthorizationService authorizationService,
                                        OAuth2TokenGenerator<? extends OAuth2Token> tokenGenerator) {
        this.authenticationManager = authenticationManager;
        this.authorizationService = authorizationService;
        this.tokenGenerator = tokenGenerator;

    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        WebAppAuthenticationToken webAppAuthenticationToken = (WebAppAuthenticationToken) authentication;
        Map<String, Object> additionalParameters = webAppAuthenticationToken.getAdditionalParameters();
        String username = (String) additionalParameters.get("username");
        String password = (String) additionalParameters.get("password");



        return webAppAuthenticationToken;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return WebAppAuthenticationToken.class.isAssignableFrom(authentication);
    }


}
