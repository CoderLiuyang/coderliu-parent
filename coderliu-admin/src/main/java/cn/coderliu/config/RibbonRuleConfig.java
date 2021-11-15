package cn.coderliu.config;

import com.netflix.loadbalancer.IRule;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;


/**
 * @author liu
 */
@Configurable
public class RibbonRuleConfig {

    @Bean
    public IRule ribbonRule() {
        return new NacosWeightRule();
    }
}
