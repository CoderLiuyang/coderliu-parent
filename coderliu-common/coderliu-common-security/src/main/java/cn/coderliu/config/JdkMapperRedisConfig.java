package cn.coderliu.config;


import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;

/**
 * redis配置bean
 *
 * @author liu
 */
public class JdkMapperRedisConfig {


    @Bean(name = "jdkMapperRedisTemplate")
    public JdkMapperRedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
        JdkMapperRedisTemplate<String, Object> redisTemplate = new JdkMapperRedisTemplate<>();
        redisTemplate.setKeySerializer(RedisSerializer.string());
        redisTemplate.setHashKeySerializer(RedisSerializer.string());
        redisTemplate.setValueSerializer(RedisSerializer.java());
        redisTemplate.setHashValueSerializer(RedisSerializer.java());
        redisTemplate.setConnectionFactory(factory);
        return redisTemplate;
    }
}
