 

package cn.coderliu.config;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

/**
 * 资源服务器对外直接暴露URL,如果设置contex-path 要特殊处理
 */
@Slf4j
@ConfigurationProperties(prefix = "security.oauth2.ignore")
public class PermitAllUrlProperties implements InitializingBean {

    private static final Pattern PATTERN = Pattern.compile("\\{(.*?)\\}");

    private static final String[] DEFAULT_IGNORE_URLS = new String[]{"/actuator/**",
            "/error",
            //获取用户详情放行
            "/user/getUserDetail"
    };

    @Getter
    @Setter
    private List<String> urls = new ArrayList<>();

    @Override
    public void afterPropertiesSet() {
        urls.addAll(Arrays.asList(DEFAULT_IGNORE_URLS));
        /**
         * Inner 注解注入
         */
//		RequestMappingHandlerMapping mapping = SpringUtil.getBean("requestMappingHandlerMapping");
//		Map<RequestMappingInfo, HandlerMethod> map = mapping.getHandlerMethods();
//
//		map.keySet().forEach(info -> {
//			HandlerMethod handlerMethod = map.get(info);
//
//			// 获取方法上边的注解 替代path variable 为 *
//			Inner method = AnnotationUtils.findAnnotation(handlerMethod.getMethod(), Inner.class);
//			Optional.ofNullable(method).ifPresent(inner -> Objects.requireNonNull(info.getPathPatternsCondition())
//					.getPatternValues().forEach(url -> urls.add(ReUtil.replaceAll(url, PATTERN, "*"))));
//
//			// 获取类上边的注解, 替代path variable 为 *
//			Inner controller = AnnotationUtils.findAnnotation(handlerMethod.getBeanType(), Inner.class);
//			Optional.ofNullable(controller).ifPresent(inner -> Objects.requireNonNull(info.getPathPatternsCondition())
//					.getPatternValues().forEach(url -> urls.add(ReUtil.replaceAll(url, PATTERN, "*"))));
//		});
    }

}
