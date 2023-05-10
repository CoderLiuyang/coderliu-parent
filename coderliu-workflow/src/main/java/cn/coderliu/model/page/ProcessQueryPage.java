package cn.coderliu.model.page;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.HashMap;
import java.util.Map;

/**
 * 流程查询实体对象
 *
 * @author KonBAI
 * @createTime 2022/6/11 01:15
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ProcessQueryPage extends Page {

    /**
     * 流程标识
     */
    private String processKey;

    /**
     * 流程名称
     */
    private String processName;

    /**
     * 流程分类
     */
    private String category;

    /**
     * 状态
     */
    private String state;

    /**
     * 请求参数
     */
    private Map<String, Object> params = new HashMap<>();
}
