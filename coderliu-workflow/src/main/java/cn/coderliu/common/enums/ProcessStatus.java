package cn.coderliu.common.enums;

import cn.hutool.core.util.StrUtil;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author konbai
 * @since 2023/3/9 00:45
 */
@Getter
@AllArgsConstructor
public enum ProcessStatus {

    /**
     * 进行中（审批中）
     */
    RUNNING("running"),
    /**
     * 已终止
     */
    TERMINATED("terminated"),
    /**
     * 已完成
     */
    COMPLETED("completed"),
    /**
     * 已取消
     */
    CANCELED("canceled");

    private final String status;

    public static ProcessStatus getProcessStatus(String str) {
        if (StrUtil.isNotBlank(str)) {
            for (ProcessStatus value : values()) {
                if (StrUtil.equalsIgnoreCase(str, value.getStatus())) {
                    return value;
                }
            }
        }
        return null;
    }
}
