package cn.coderliu.model;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程抄送对象 wf_copy
 *
 * @author KonBAI
 * @date 2022-05-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wf_copy")
public class WfCopy extends BaseModel {

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
     * 部署主键
     */
    private String deploymentId;
    /**
     * 流程实例主键
     */
    private String instanceId;
    /**
     * 任务主键
     */
    private String taskId;
    /**
     * 用户主键
     */
    private String userId;
    /**
     * 发起人Id
     */
    private String originatorId;
    /**
     * 发起人名称
     */
    private String originatorName;

}
