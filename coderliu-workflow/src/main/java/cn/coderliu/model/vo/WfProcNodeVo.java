package cn.coderliu.model.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.flowable.engine.task.Comment;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 工作流节点元素视图对象
 *
 * @author KonBAI
 * @createTime 2022/9/11 22:04
 */
@Data
public class WfProcNodeVo implements Serializable {
    /**
     * 流程ID
     */
    private String procDefId;
    /**
     * 活动ID
     */
    private String activityId;
    /**
     * 活动名称
     */
    private String activityName;
    /**
     * 活动类型
     */
    private String activityType;
    /**
     * 活动耗时
     */
    private String duration;
    /**
     * 执行人Id
     */
    private Long assigneeId;
    /**
     * 执行人名称
     */
    private String assigneeName;
    /**
     * 候选执行人
     */
    private String candidate;
    /**
     * 任务意见
     */
    private List<Comment> commentList;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 结束时间
     */
    private Date endTime;
}
