package cn.coderliu.enums;


/**
 * 微信支付枚举
 *
 * @author liu
 */
public enum WxPayCodeEnum {

    SUCCESS("SUCCESS"),
    FAIL("FAIL");

    private String code;

    WxPayCodeEnum(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
