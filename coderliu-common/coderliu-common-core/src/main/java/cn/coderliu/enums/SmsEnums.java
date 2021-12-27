package cn.coderliu.enums;


/**
 * 发送短信的模版枚举
 * @author liu
 */
public enum SmsEnums {
    /**
     * 提现模版
     */
    AUTH("SMS_190165136"),
    CASH_OUT("SMS_205390643");

    private String code;

    SmsEnums(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
