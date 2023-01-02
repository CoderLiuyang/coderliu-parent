package cn.coderliu.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.ClassUtils;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Optional;

/**
 * 自动填充配置
 */
@Slf4j
public class MybatisPlusMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        Date now = new Date();
        fillValIfNullByName("createTime", now, metaObject);
        fillValIfNullByName("updateTime", now, metaObject);
        fillValIfNullByName("createBy", getUserName(), metaObject);
        fillValIfNullByName("updateBy", getUserName(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        fillValIfNullByName("updateTime", new Date(), metaObject);
        fillValIfNullByName("updateBy", getUserName(), metaObject);
    }

    /**
     * 填充值，先判断是否有手动设置，优先手动设置的值，例如：job必须手动设置
     *
     * @param fieldName  属性名
     * @param fieldVal   属性值
     * @param metaObject MetaObject
     */
    private static void fillValIfNullByName(String fieldName, Object fieldVal, MetaObject metaObject) {
        if (!metaObject.hasSetter(fieldName)) {
            return;
        }
        Class<?> getterType = metaObject.getGetterType(fieldName);
        if (ClassUtils.isAssignableValue(getterType, fieldVal)) {
            metaObject.setValue(fieldName, fieldVal);
        }
    }

    /**
     * 获取 spring security 当前的用户名
     *
     * @return 当前用户名
     */
    private String getUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (Optional.ofNullable(authentication).isPresent()) {
            return authentication.getName();
        }
        return null;
    }


}
