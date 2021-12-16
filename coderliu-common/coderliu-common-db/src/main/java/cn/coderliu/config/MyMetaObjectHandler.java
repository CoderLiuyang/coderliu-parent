package cn.coderliu.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 新增和插入拦截
 *
 * @author liu
 */
@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {


    @Autowired
    private HttpServletRequest request;


    @Override
    public void insertFill(MetaObject metaObject) {
        Object loginUserName = request.getAttribute("loginUserName");
        if (loginUserName != null) {
            this.fillStrategy(metaObject, "createdBy", loginUserName.toString());
        }
        this.fillStrategy(metaObject, "createdTime", new Date());
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        Object loginUserName = request.getAttribute("loginUserName");
        if (loginUserName != null) {
            this.fillStrategy(metaObject, "updatedBy", loginUserName.toString());
        }
        this.fillStrategy(metaObject, "updatedTime", new Date());
    }
}
