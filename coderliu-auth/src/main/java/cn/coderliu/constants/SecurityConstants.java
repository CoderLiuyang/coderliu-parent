package cn.coderliu.constants;

public class SecurityConstants {


    /**
     * 协议字段
     */
    public static String DETAILS_LICENSE = "license";
    public static String PROJECT_LICENSE = "https://www.qijin.net/";

    /**
     * 客户端ID
     */
    public static String CLIENT_ID = "clientId";


    /**
     * 用户信息
     */
    public static String DETAILS_USER = "user_info";


    /**
     * {bcrypt} 加密的特征码
     */
    public static String BCRYPT = "{bcrypt}";

    /**
     * {noop} 加密的特征码
     */
    public static String NOOP = "{noop}";

    /**
     * 手机号登录
     */
    public static String APP = "app";

    /**
     * 短信登录 参数名称
     */
    public static String SMS_PARAMETER_NAME = "phone";
    /**
     * 授权码模式confirm
     */
    public static String CUSTOM_CONSENT_PAGE_URI = "/token/confirm_access";
}
