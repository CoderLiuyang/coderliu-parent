package cn.coderliu.config;


import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.cloud.netflix.ribbon.RibbonClients;

/**
 * @author liu
 */
@Configurable
@RibbonClients(defaultConfiguration = RibbonRuleConfig.class)
public class RibbonConfig {
}
