package cn.coderliu.config;


import cn.coderliu.constants.SecurityConstants;
import cn.coderliu.model.SysOauthClientDetails;
import cn.coderliu.utils.OAuthClientException;
import cn.hutool.core.util.BooleanUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.security.oauth2.server.authorization.settings.ClientSettings;
import org.springframework.security.oauth2.server.authorization.settings.OAuth2TokenFormat;
import org.springframework.security.oauth2.server.authorization.settings.TokenSettings;
import org.springframework.util.StringUtils;

import java.time.Duration;
import java.util.Arrays;
import java.util.Optional;

/**
 * 注册客户端仓库查询的实现方式
 */
@Configuration
@RequiredArgsConstructor
public class DBRegisteredClientRepository implements RegisteredClientRepository {

    /**
     * 刷新令牌有效期默认 30 天
     */
    private final static int refreshTokenValiditySeconds = 60 * 60 * 24 * 30;

    /**
     * 请求令牌有效期默认 12 小时
     */
    private final static int accessTokenValiditySeconds = 60 * 60 * 12;

    private final JdbcTemplate jdbcTemplate;

    @Override
    public void save(RegisteredClient registeredClient) {
        throw new UnsupportedOperationException();
    }

    @Override
    public RegisteredClient findById(String id) {
        throw new UnsupportedOperationException();
    }


    /**
     * 重写查询client方法
     */
    @Override
    @SneakyThrows
    public RegisteredClient findByClientId(String clientId) {

        SysOauthClientDetails clientDetails = jdbcTemplate
                .queryForObject("select * from sys_oauth_client_details where client_id = '" + clientId + "'", new BeanPropertyRowMapper<>(
                        SysOauthClientDetails.class));

        if (clientDetails == null) {
            throw new OAuthClientException("客户端查询异常，请检查数据库链接");
        }
        RegisteredClient.Builder builder = RegisteredClient.withId(clientDetails.getClientId())
                .clientId(clientDetails.getClientId())
                .clientSecret(SecurityConstants.NOOP + clientDetails.getClientSecret())
                .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_BASIC);

        // 授权模式
        Optional.ofNullable(clientDetails.getAuthorizedGrantTypes())
                .ifPresent(grants -> StringUtils.commaDelimitedListToSet(grants)
                        .forEach(s -> builder.authorizationGrantType(new AuthorizationGrantType(s))));

        // 回调地址
        Optional.ofNullable(clientDetails.getWebServerRedirectUri()).ifPresent(redirectUri -> Arrays
                .stream(redirectUri.split(StrUtil.COMMA)).filter(StrUtil::isNotBlank).forEach(builder::redirectUri));

        // scope
        Optional.ofNullable(clientDetails.getScope()).ifPresent(
                scope -> Arrays.stream(scope.split(StrUtil.COMMA)).filter(StrUtil::isNotBlank).forEach(builder::scope));

        return builder
                .tokenSettings(TokenSettings.builder().accessTokenFormat(OAuth2TokenFormat.REFERENCE)
                        .accessTokenTimeToLive(Duration.ofSeconds(Optional
                                .ofNullable(clientDetails.getAccessTokenValidity()).orElse(accessTokenValiditySeconds)))
                        .refreshTokenTimeToLive(
                                Duration.ofSeconds(Optional.ofNullable(clientDetails.getRefreshTokenValidity())
                                        .orElse(refreshTokenValiditySeconds)))
                        .build())
                .clientSettings(ClientSettings.builder()
                        .requireAuthorizationConsent(!BooleanUtil.toBoolean(clientDetails.getAutoapprove())).build())
                .build();
    }
}
