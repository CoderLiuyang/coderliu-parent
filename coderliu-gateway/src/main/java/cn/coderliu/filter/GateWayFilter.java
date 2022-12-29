package cn.coderliu.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;


/**
 * 网关全局过滤
 */
@Slf4j
@Component
public class GateWayFilter implements GlobalFilter, Ordered {


    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        log.info("-----------------------------请求开始-----------------------------");
        log.info("请求的URI：" + exchange.getRequest().getURI());
        final HttpHeaders headers = exchange.getRequest().getHeaders();
        headers.forEach((k, v) -> {
            log.info("请求的请求头：" + k + "_" + v);
        });
        log.info("请求的参数：" + exchange.getRequest().getBody());
        log.info("-----------------------------请求结束-----------------------------");
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return Ordered.LOWEST_PRECEDENCE;
    }
}
