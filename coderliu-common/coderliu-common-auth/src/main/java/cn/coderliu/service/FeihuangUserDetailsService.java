package cn.coderliu.service;

import cn.coderliu.model.LoginAppUser;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @ClassName: SpeesiteUserDetailsService
 * @Description:
 * @Author: liu
 * @Date: 2020/9/8 2:30 下午
 * @Version: V1.0
 **/
public interface FeihuangUserDetailsService extends UserDetailsService {
    /**
     * 根据电话号码查询用户
     *
     * @param mobile
     * @return
     */
    LoginAppUser loadUserByMobile(String mobile, String clinetId);

    /**
     * wx 授权
     * @param code
     * @param clientId
     * @return
     */
    LoginAppUser loadUserByWXCode(String code, String clientId, int type, String uuid);

    /**
     * 设备授权
     * @param uniqueId
     * @param clientId
     * @return
     */
    LoginAppUser loadUserByUniqueId(String uniqueId, String clientId, String uuid);

}
