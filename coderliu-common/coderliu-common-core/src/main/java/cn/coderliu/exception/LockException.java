package cn.coderliu.exception;

/**
 * @ClassName: LockException
 * @Description:
 * @Author: liu
 * @Date: 2020/9/8 4:53 下午
 * @Version: V1.0
 **/
public class LockException extends RuntimeException {

    public LockException(String message) {
        super(message);
    }
}
