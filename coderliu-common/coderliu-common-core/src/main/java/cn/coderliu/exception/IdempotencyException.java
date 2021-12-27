package cn.coderliu.exception;

/**
 * @ClassName: IdempotencyException
 * @Description:
 * @Author: liu
 * @Date: 2020/9/8 4:22 下午
 * @Version: V1.0
 **/
public class IdempotencyException extends RuntimeException {

    public IdempotencyException(String message) {
        super(message);
    }
}
