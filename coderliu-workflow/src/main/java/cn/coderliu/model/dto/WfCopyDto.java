package cn.coderliu.model.dto;

import cn.coderliu.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程抄送业务对象 wf_copy
 *
 * @author ruoyi
 * @date 2022-05-19
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class WfCopyDto extends BaseModel {

    /**
     * 抄送主键
     */
    private Long copyId;

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
