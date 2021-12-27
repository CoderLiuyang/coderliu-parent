package cn.coderliu.config;

import cn.coderliu.mobile.DeviceAuthenticationSecurityConfig;
import cn.coderliu.mobile.MobileAndVerificationCodeAuthenticationSecurityConfig;
import cn.coderliu.mobile.WxAuthenticationSecurityConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.annotation.Resource;

/**
 * @ClassName: SecurityConfig
 * @Description: 在WebSecurityConfigurerAdapter不拦截oauth要开放的资源
 * @Author: liu
 * @Date: 2020/9/8 2:18 下午
 * @Version: V1.0
 **/
@Configuration
@Import(DefaultPasswordConfig.class)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired(required = false)
    private AuthenticationEntryPoint authenticationEntryPoint;

    @Resource
    private UserDetailsService userDetailsService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private MobileAndVerificationCodeAuthenticationSecurityConfig mobileAndVerificationCodeAuthenticationSecurityConfig;
    @Autowired
    private WxAuthenticationSecurityConfig wxAuthenticationSecurityConfig;
    @Autowired
    private DeviceAuthenticationSecurityConfig deviceAuthenticationSecurityConfig;


    /**
     * 这一步的配置是必不可少的，否则SpringBoot会自动配置一个AuthenticationManager,覆盖掉内存中的用户
     *
     * @return 认证管理对象
     */
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    /**
     * 1:请求授权
     * 2:定制登录行为。
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .anyRequest()
                //授权服务器关闭basic认证
                .permitAll()
                .and().apply(mobileAndVerificationCodeAuthenticationSecurityConfig)
                .and().apply(wxAuthenticationSecurityConfig)
                .and().apply(deviceAuthenticationSecurityConfig);
        http.csrf().disable();
        // 基于密码 等模式可以无session,不支持授权码模式
        if (authenticationEntryPoint != null) {
            http.exceptionHandling().authenticationEntryPoint(authenticationEntryPoint);
            http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        } else {
            // 授权码模式单独处理，需要session的支持，此模式可以支持所有oauth2的认证
            http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED);
        }
    }

    /**
     * 全局用户信息
     */
    @Autowired
    public void globalUserDetails(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }
}
