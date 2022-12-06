package cn.coderliu.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity
public class DefaultSecurityConfig {

    /**
     * 用于身份验证的 Spring Security 过滤器链
     */
    @Bean
    public SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests((authorize) -> authorize.anyRequest().authenticated())
                //表单登录处理从授权服务器过滤器链
                .formLogin(Customizer.withDefaults());
        return http.build();
    }

    /**
     * 配置UserDetails
     */
    @Bean
    public InMemoryUserDetailsManager userDetailsService() {
        //这里用固定的用户，后续改成从数据库查询
        UserDetails userDetails = User.withDefaultPasswordEncoder()
                .username("admin")
                .password("111111")
                .roles("USER").build();

        return new InMemoryUserDetailsManager(userDetails);
    }
}
