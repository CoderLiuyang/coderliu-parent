package cn.coderliu.exception;

/**
 * @ClassName: BusinessException
 * @Description:
 * @Author: liu
 * @Date: 2020/9/8 4:23 下午
 * @Version: V1.0
 **/
public class BusinessException extends RuntimeException {

    public BusinessException(String message) {
        super(message);
    }
}
