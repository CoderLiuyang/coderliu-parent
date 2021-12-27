package cn.coderliu.lock;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @ClassName: ZLock
 * @Description: 锁对象抽象
 * @Author: liu
 * @Date: 2020/9/8 4:54 下午
 * @Version: V1.0
 **/
@AllArgsConstructor
public class ZLock implements AutoCloseable {
    @Getter
    private final Object lock;

    private final DistributedLock locker;

    @Override
    public void close() throws Exception {
        locker.unlock(lock);
    }
}
