package cn.coderliu.config;

import com.alibaba.cloud.nacos.NacosDiscoveryProperties;
import com.alibaba.cloud.nacos.ribbon.NacosServer;
import com.alibaba.nacos.api.exception.NacosException;
import com.alibaba.nacos.api.naming.NamingService;
import com.alibaba.nacos.api.naming.pojo.Instance;
import com.alibaba.nacos.client.naming.core.Balancer;
import com.netflix.client.config.IClientConfig;
import com.netflix.loadbalancer.AbstractLoadBalancerRule;
import com.netflix.loadbalancer.BaseLoadBalancer;
import com.netflix.loadbalancer.Server;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author liu
 */

@Slf4j
public class NacosSameClusterWeightRule extends AbstractLoadBalancerRule {

    @Autowired
    private NacosDiscoveryProperties nacosDiscoveryProperties;

    @Override
    public void initWithNiwsConfig(IClientConfig iClientConfig) {

    }

    @Override
    public Server choose(Object key) {
        try {
            //拿到配置文件中的集群名称
            String clusterName = nacosDiscoveryProperties.getClusterName();
            BaseLoadBalancer loadBalancer = (BaseLoadBalancer) getLoadBalancer();
            String name = loadBalancer.getName();
            NamingService namingService = nacosDiscoveryProperties.namingServiceInstance();

            List<Instance> instances = namingService.selectInstances(name, true);
            List<Instance> samClusterInstances = instances.stream()
                    .filter(i -> Objects.equals(i.getClusterName(), clusterName)).collect(Collectors.toList());
            List<Instance> chooseInstances;
            if (samClusterInstances.isEmpty()) {
                chooseInstances = instances;
                log.warn("发生跨集群调用name{},clusterName{},instanse{}", name, clusterName, instances);
            } else {
                chooseInstances = samClusterInstances;
            }
            Instance instance = ExtendBalancer.getHostByRandomWeight2(chooseInstances);
            return new NacosServer(instance);
        } catch (NacosException e) {
            log.error(e.toString());
            return null;
        }

    }
}

class ExtendBalancer extends Balancer {
    public static Instance getHostByRandomWeight2(List<Instance> hosts) {
        return getHostByRandomWeight(hosts);
    }
}
