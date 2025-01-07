package cn.coderliu.config;

import cn.coderliu.component.CustomBearerTokenExtractor;
import cn.coderliu.component.ResourceAuthExceptionEntryPoint;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.oauth2.server.resource.introspection.OpaqueTokenIntrospector;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Slf4j
@RequiredArgsConstructor
public class ResourceServerConfiguration {

    protected final ResourceAuthExceptionEntryPoint resourceAuthExceptionEntryPoint;

    private final PermitAllUrlProperties permitAllUrl;

    private final CustomBearerTokenExtractor customBearerTokenExtractor;

    private final OpaqueTokenIntrospector customOpaqueTokenIntrospector;


    //    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//
//        http.authorizeRequests(authorizeRequests -> authorizeRequests
//                        .antMatchers(ArrayUtil.toArray(permitAllUrl.getUrls(), String.class))
//                        .permitAll().anyRequest()
//                        .authenticated())
//                .oauth2ResourceServer(
//                        oauth2 -> oauth2.opaqueToken(token -> token.introspector(customOpaqueTokenIntrospector))
//                                .authenticationEntryPoint(resourceAuthExceptionEntryPoint)
//                                .bearerTokenResolver(customBearerTokenExtractor))
//                .headers().frameOptions().disable().and().csrf().disable();
//
//        return http.build();
//    }
    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE)
    SecurityFilterChain resourceServer(HttpSecurity http) throws Exception {
        AntPathRequestMatcher[] permitMatchers = permitAllUrl.getUrls()
                .stream()
                .map(AntPathRequestMatcher::new)
                .toList()
                .toArray(new AntPathRequestMatcher[]{});

        http.authorizeHttpRequests(authorizeRequests -> authorizeRequests.requestMatchers(permitMatchers)
                        .permitAll()
                        .anyRequest()
                        .authenticated())
                .oauth2ResourceServer(
                        oauth2 -> oauth2.opaqueToken(token -> token.introspector(customOpaqueTokenIntrospector))
                                .authenticationEntryPoint(resourceAuthExceptionEntryPoint)
                                .bearerTokenResolver(customBearerTokenExtractor))
                .headers(headers -> headers.frameOptions(HeadersConfigurer.FrameOptionsConfig::disable))
                .csrf(AbstractHttpConfigurer::disable);
        return http.build();
    }
}
