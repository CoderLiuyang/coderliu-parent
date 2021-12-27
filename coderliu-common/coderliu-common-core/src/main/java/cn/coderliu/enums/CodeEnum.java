package cn.coderliu.enums;

/**
 * @ClassName: CodeEnum
 * @Description:
 * @Author: liu
 * @Date: 2020/9/8 4:20 下午
 * @Version: V1.0
 **/
public enum CodeEnum {
    SUCCESS(0),
    ERROR(1);

    private Integer code;
    CodeEnum(Integer code){
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }
}
