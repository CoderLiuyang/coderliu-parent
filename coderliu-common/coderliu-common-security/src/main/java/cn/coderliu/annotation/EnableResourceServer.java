 

package cn.coderliu.annotation;

import cn.coderliu.config.ResourceServerAutoConfiguration;
import cn.coderliu.config.ResourceServerConfiguration;
import cn.coderliu.feign.FeignClientConfiguration;
import org.springframework.context.annotation.Import;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import java.lang.annotation.*;

/**
 * 资源服务注解
 */
@Documented
@Inherited
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@Import({ResourceServerAutoConfiguration.class, ResourceServerConfiguration.class,
        FeignClientConfiguration.class})
public @interface EnableResourceServer {

}
