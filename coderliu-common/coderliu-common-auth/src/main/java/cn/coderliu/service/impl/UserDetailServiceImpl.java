package cn.coderliu.service.impl;

import cn.coderliu.model.LoginAppUser;
import cn.coderliu.service.FeihuangUserDetailsService;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.common.exceptions.InvalidGrantException;
import org.springframework.social.security.SocialUserDetails;
import org.springframework.social.security.SocialUserDetailsService;
import org.springframework.stereotype.Service;

/**
 * @ClassName: UserDetailServiceImpl
 * @Description:
 * @Author: liu
 * @Date: 2020/9/8 4:04 下午
 * @Version: V1.0
 **/
@Service
@Slf4j
public class UserDetailServiceImpl implements FeihuangUserDetailsService, SocialUserDetailsService {

    private final static String appId = "wxa28667e2bdcd7d77";
    private final static String secret = "bff398f94d5a89d932cc208d6035d8f6";

    private final static String gzh_appId = "wxebf65957532b346c";
    private final static String gzh_secret = "7791ba0d2d3ca3c31ab040fd1aed06f4";

    private final static String wx_token_url = "https://api.weixin.qq.com/sns/oauth2/access_token";
    private final static String wx_user_url = "https://api.weixin.qq.com/sns/userinfo";

//    @Autowired
//    private FeignFeihuangUserService feignFeihuangUserService;

    /**
     * 手机号验证码授权
     */
    @Override
    public LoginAppUser loadUserByMobile(String mobile, String clinetId) {
//        FeignSysUserDto sysUserDto = new FeignSysUserDto();
//        sysUserDto.setMobile(mobile);
//        sysUserDto.setClientId(clinetId);
//        ReturnData<FeignSysUserVo> returnData = feignFeihuangUserService.loginSms(sysUserDto);
//        FeignSysUserVo feignSysUserVo = returnData.getData();
//        LoginAppUser loginAppUser = new LoginAppUser();
//        // 这里ID和Username都使用业务用户ID 保证oauth生成token的唯一性
//        loginAppUser.setId(feignSysUserVo.getId());
//        loginAppUser.setUsername(feignSysUserVo.getId());
//        loginAppUser.setEnabled(feignSysUserVo.getEnabled());
//        loginAppUser.setMobile(feignSysUserVo.getMobile());
//        return checkUser(loginAppUser);
        return null;
    }

    /**
     * 微信授权
     */
    @Override
    public LoginAppUser loadUserByWXCode(String code, String clientId, int type, String uuid) {
        JSONObject userDataJson;
//        if(type == 2) {
//            userDataJson = WxOauthUtil.getUserData(gzh_appId, gzh_secret, wx_token_url, wx_user_url, code);
//        } else {
//            userDataJson = WxOauthUtil.getUserData(appId, secret, wx_token_url, wx_user_url, code);
//        }
//        if(StringUtils.isBlank(userDataJson.getString("openid"))){
//            throw new InvalidGrantException("Could not authenticate wx code: " + code);
//        }
//        // 通过微信用户信息查询系统授权用户 处理授权逻辑
//        FeignUserOauthDto feignUserOauthDto = new FeignUserOauthDto();
//        feignUserOauthDto.setOpenId(userDataJson.getString("openid"));
//        feignUserOauthDto.setNickName(userDataJson.getString("nickname"));
//        feignUserOauthDto.setSex(userDataJson.getInteger("sex"));
//        feignUserOauthDto.setProvince(userDataJson.getString("province"));
//        feignUserOauthDto.setCity(userDataJson.getString("city"));
//        feignUserOauthDto.setCountry(userDataJson.getString("country"));
//        feignUserOauthDto.setHeadimgurl(userDataJson.getString("headimgurl"));
//        feignUserOauthDto.setUnionid(userDataJson.getString("unionid"));
//        feignUserOauthDto.setPrivilege(userDataJson.getString("privilege"));
//        feignUserOauthDto.setClientId(clientId);
//        feignUserOauthDto.setUserType(type);
//        feignUserOauthDto.setUuid(uuid);
//        ReturnData<FeignUserOauthVo> feignUserOauthVoReturnData = feignFeihuangUserService.loginOpenId(feignUserOauthDto);
//        FeignUserOauthVo feignUserOauthVo = feignUserOauthVoReturnData.getData();
//
//        LoginAppUser loginAppUser = new LoginAppUser();
//        loginAppUser.setId(feignUserOauthVo.getUserId());
//        loginAppUser.setUsername(feignUserOauthVo.getUserId());
//        loginAppUser.setEnabled(true);
//        return checkUser(loginAppUser);
        return null;
    }

    /**
     * 设备ID授权
     */
    @Override
    public LoginAppUser loadUserByUniqueId(String uniqueId, String clientId, String apkCommentJson) {
//        FeignDeviceDto feignDeviceDto = new FeignDeviceDto();
//        feignDeviceDto.setClientId(clientId);
//        feignDeviceDto.setPseudoUniqueId(uniqueId);
//        feignDeviceDto.setApkCommentJson(apkCommentJson);
//        ReturnData<FeignSysUserVo> returnData = feignFeihuangUserService.loginDevice(feignDeviceDto);
//        FeignSysUserVo feignSysUserVo = returnData.getData();
//        LoginAppUser loginAppUser = new LoginAppUser();
//        // 这里ID和Username都使用业务用户ID 保证oauth生成token的唯一性
//        loginAppUser.setId(feignSysUserVo.getId());
//        loginAppUser.setUsername(feignSysUserVo.getId());
//        loginAppUser.setEnabled(feignSysUserVo.getEnabled());
//        loginAppUser.setMobile(feignSysUserVo.getMobile());
//        return checkUser(loginAppUser);
        return null;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return null;
    }

    @Override
    public SocialUserDetails loadUserByUserId(String userId) throws UsernameNotFoundException {
        return null;
    }

    private LoginAppUser checkUser(LoginAppUser loginAppUser) {
        if (loginAppUser != null && !loginAppUser.isEnabled()) {
            throw new DisabledException("用户已作废");
        }
        return loginAppUser;
    }
}
