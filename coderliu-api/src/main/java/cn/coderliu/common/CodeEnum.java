package cn.coderliu.common;

/**
 * @author liu
 */
public enum CodeEnum {
    SUCCESS(0),
    ERROR(1),

    /**
     * 字段验证错误
     */
    FIELDERROR(2),


    TIMEOUT(99);


    private Integer code;

    CodeEnum(Integer code) {
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }
}
