package cn.coderliu.config;

import cn.coderliu.constants.SecurityConstants;
import cn.coderliu.handler.CustomAuthenticationFailureEventHandler;
import cn.coderliu.handler.CustomAuthenticationSuccessEventHandler;
import cn.coderliu.support.core.CustomDaoAuthenticationProvider;
import cn.coderliu.support.core.FormIdentityLoginConfigurer;
import cn.coderliu.support.password.OAuth2ResourceOwnerPasswordAuthenticationConverter;
import cn.coderliu.support.password.OAuth2ResourceOwnerPasswordAuthenticationProvider;
import cn.coderliu.support.sms.OAuth2ResourceOwnerSmsAuthenticationConverter;
import cn.coderliu.support.sms.OAuth2ResourceOwnerSmsAuthenticationProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.server.authorization.OAuth2AuthorizationService;
import org.springframework.security.oauth2.server.authorization.config.annotation.web.configurers.OAuth2AuthorizationServerConfigurer;
import org.springframework.security.oauth2.server.authorization.settings.AuthorizationServerSettings;
import org.springframework.security.oauth2.server.authorization.token.DelegatingOAuth2TokenGenerator;
import org.springframework.security.oauth2.server.authorization.token.OAuth2RefreshTokenGenerator;
import org.springframework.security.oauth2.server.authorization.token.OAuth2TokenGenerator;
import org.springframework.security.oauth2.server.authorization.web.authentication.OAuth2AuthorizationCodeAuthenticationConverter;
import org.springframework.security.oauth2.server.authorization.web.authentication.OAuth2AuthorizationCodeRequestAuthenticationConverter;
import org.springframework.security.oauth2.server.authorization.web.authentication.OAuth2ClientCredentialsAuthenticationConverter;
import org.springframework.security.oauth2.server.authorization.web.authentication.OAuth2RefreshTokenAuthenticationConverter;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationConverter;
import org.springframework.security.web.authentication.DelegatingAuthenticationConverter;

import java.util.Arrays;

@Configuration
@RequiredArgsConstructor
public class AuthSecurityConfig {


    private final OAuth2AuthorizationService authorizationService;

    /**
     * 端点的 Spring Security 过滤器链
     *
     * @param http
     * @return
     * @throws Exception
     */
    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE)
    public SecurityFilterChain authorizationServerSecurityFilterChain(HttpSecurity http)
            throws Exception {
//        OAuth2AuthorizationServerConfigurer authorizationServerConfigurer = new OAuth2AuthorizationServerConfigurer();
//
//        http.apply(authorizationServerConfigurer.tokenEndpoint((tokenEndpoint) -> {// 个性化认证授权端点
//                    tokenEndpoint.accessTokenRequestConverter(accessTokenRequestConverter()) // 注入自定义的授权认证Converter
//                            .accessTokenResponseHandler(new CustomAuthenticationSuccessEventHandler()) // 登录成功处理器
//                            .errorResponseHandler(new CustomAuthenticationFailureEventHandler());// 登录失败处理器
//                }).clientAuthentication(oAuth2ClientAuthenticationConfigurer -> // 个性化客户端认证
//                        oAuth2ClientAuthenticationConfigurer.errorResponseHandler(new CustomAuthenticationFailureEventHandler()))// 处理客户端认证异常
//                .authorizationEndpoint(authorizationEndpoint -> authorizationEndpoint// 授权码端点个性化confirm页面
//                        .consentPage(SecurityConstants.CUSTOM_CONSENT_PAGE_URI)));
//
//        RequestMatcher endpointsMatcher = authorizationServerConfigurer.getEndpointsMatcher();
//        DefaultSecurityFilterChain securityFilterChain =
//
//                http.requestMatcher(endpointsMatcher)
//                .authorizeRequests(authorizeRequests -> authorizeRequests.anyRequest().authenticated())
//                .apply(authorizationServerConfigurer.authorizationService(authorizationService)// redis存储token的实现
//                        .authorizationServerSettings(AuthorizationServerSettings.builder()
//                                .issuer(SecurityConstants.PROJECT_LICENSE).build()))
//                // 授权码登录的登录页个性化
//                .and().apply(new FormIdentityLoginConfigurer()).and().build();
//
//        // 注入自定义授权模式实现
//        addCustomOAuth2GrantAuthenticationProvider(http);

        // 配置授权服务器的安全策略，只有/oauth2/**的请求才会走如下的配置
	//	http.securityMatcher("/oauth2/**");
		OAuth2AuthorizationServerConfigurer authorizationServerConfigurer = new OAuth2AuthorizationServerConfigurer();

		// 增加验证码过滤器
	//	http.addFilterBefore(validateCodeFilter, UsernamePasswordAuthenticationFilter.class);
		// 增加密码解密过滤器
	//	http.addFilterBefore(passwordDecoderFilter, UsernamePasswordAuthenticationFilter.class);

		http.with(authorizationServerConfigurer.tokenEndpoint((tokenEndpoint) -> {// 个性化认证授权端点
			tokenEndpoint.accessTokenRequestConverter(accessTokenRequestConverter()) // 注入自定义的授权认证Converter
				.accessTokenResponseHandler(new CustomAuthenticationSuccessEventHandler()) // 登录成功处理器
				.errorResponseHandler(new CustomAuthenticationFailureEventHandler());// 登录失败处理器
		}).clientAuthentication(oAuth2ClientAuthenticationConfigurer -> // 个性化客户端认证
		oAuth2ClientAuthenticationConfigurer.errorResponseHandler(new CustomAuthenticationFailureEventHandler()))// 处理客户端认证异常
			.authorizationEndpoint(authorizationEndpoint -> authorizationEndpoint// 授权码端点个性化confirm页面
				.consentPage(SecurityConstants.CUSTOM_CONSENT_PAGE_URI)), Customizer.withDefaults())
			.authorizeHttpRequests(authorizeRequests -> authorizeRequests.anyRequest().authenticated());

		// 设置 Token 存储的策略
		http.with(authorizationServerConfigurer.authorizationService(authorizationService)// redis存储token的实现
			.authorizationServerSettings(
					AuthorizationServerSettings.builder().issuer(SecurityConstants.PROJECT_LICENSE).build()),
				Customizer.withDefaults());
		// 设置授权码模式登录页面
		http.with(new FormIdentityLoginConfigurer(), Customizer.withDefaults());
		DefaultSecurityFilterChain securityFilterChain = http.build();
		// 注入自定义授权模式实现
		addCustomOAuth2GrantAuthenticationProvider(http);
        return securityFilterChain;
    }


    /**
     * 令牌生成规则实现
     */
    @Bean
    public OAuth2TokenGenerator oAuth2TokenGenerator() {
        CustomOAuth2AccessTokenGenerator accessTokenGenerator = new CustomOAuth2AccessTokenGenerator();
        // 注入自定义Token生成器 增加关联用户信息
        accessTokenGenerator.setAccessTokenCustomizer(new CustomOAuth2TokenCustomizer());
        return new DelegatingOAuth2TokenGenerator(accessTokenGenerator, new OAuth2RefreshTokenGenerator());
    }



    /**
     * request -> xToken 注入请求转换器
     * @return DelegatingAuthenticationConverter
     */
    private AuthenticationConverter accessTokenRequestConverter() {
        return new DelegatingAuthenticationConverter(Arrays.asList(
                new OAuth2ResourceOwnerPasswordAuthenticationConverter(),
                new OAuth2ResourceOwnerSmsAuthenticationConverter(),
                new OAuth2RefreshTokenAuthenticationConverter(),
                new OAuth2ClientCredentialsAuthenticationConverter(),
                new OAuth2AuthorizationCodeAuthenticationConverter(),
                new OAuth2AuthorizationCodeRequestAuthenticationConverter()));
    }

    /**
     * 注入授权模式实现提供方
     *
     * 1. 密码模式 </br>
     * 2. 短信登录 </br>
     *
     */
    @SuppressWarnings("unchecked")
    private void addCustomOAuth2GrantAuthenticationProvider(HttpSecurity http) {
        AuthenticationManager authenticationManager = http.getSharedObject(AuthenticationManager.class);
        OAuth2AuthorizationService authorizationService = http.getSharedObject(OAuth2AuthorizationService.class);

        OAuth2ResourceOwnerPasswordAuthenticationProvider resourceOwnerPasswordAuthenticationProvider = new OAuth2ResourceOwnerPasswordAuthenticationProvider(
                authenticationManager, authorizationService, oAuth2TokenGenerator());

        OAuth2ResourceOwnerSmsAuthenticationProvider resourceOwnerSmsAuthenticationProvider;
        resourceOwnerSmsAuthenticationProvider = new OAuth2ResourceOwnerSmsAuthenticationProvider(
                authenticationManager, authorizationService, oAuth2TokenGenerator());

        // 处理 UsernamePasswordAuthenticationToken
        http.authenticationProvider(new CustomDaoAuthenticationProvider());
        // 处理 OAuth2ResourceOwnerPasswordAuthenticationToken
        http.authenticationProvider(resourceOwnerPasswordAuthenticationProvider);
        // 处理 OAuth2ResourceOwnerSmsAuthenticationToken
        http.authenticationProvider(resourceOwnerSmsAuthenticationProvider);
    }

}
