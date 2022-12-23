package cn.coderliu.config;


import cn.coderliu.serializer.FastJson2JsonRedisSerializer;
import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * @author liu
 */
public class JsonMapperRedisConfig {


    @Bean(name = "jsonMapperRedisTemplate")
    public JsonMapperRedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
        JsonMapperRedisTemplate<String, Object> template = new JsonMapperRedisTemplate<>();
        template.setConnectionFactory(factory);
        FastJson2JsonRedisSerializer serializer = new FastJson2JsonRedisSerializer(Object.class);
        ObjectMapper mapper = new ObjectMapper();
        mapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        serializer.setObjectMapper(mapper);
        template.setValueSerializer(serializer);
        template.setHashKeySerializer(serializer);
        template.setKeySerializer(new StringRedisSerializer());
        template.afterPropertiesSet();
        return template;
    }
}
