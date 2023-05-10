package cn.coderliu.model.page;

import cn.coderliu.model.WfCopy;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import lombok.EqualsAndHashCode;



/**
 * 流程抄送业务对象 wf_copy page
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class WfCopyPage extends Page<WfCopy> {
    private String id;
    /**
     * 抄送标题
     */
    private String title;

    /**
     * 流程主键
     */
    private String processId;

    /**
     * 流程名称
     */
    private String processName;

    /**
     * 流程分类主键
     */
    private String categoryId;

    /**
     * 任务主键
     */
    private String taskId;

    /**
     * 用户主键
     */
    private Long userId;

    /**
     * 发起人Id
     */
    private Long originatorId;
    /**
     * 发起人名称
     */
    private String originatorName;
}
