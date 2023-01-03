 

package cn.coderliu.component;

import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Locale;
import static org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication.Type.SERVLET;


/**
 *
 * 国际化配置
 * 注入自定义错误处理,覆盖 org/springframework/security/messages 内置异常
 */
@ConditionalOnWebApplication(type = SERVLET)
public class CustomSecurityMessageSourceConfiguration implements WebMvcConfigurer {

	@Bean
	public MessageSource securityMessageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.addBasenames("classpath:i18n/errors/messages");
		messageSource.setDefaultLocale(Locale.CHINA);
		return messageSource;
	}

}
