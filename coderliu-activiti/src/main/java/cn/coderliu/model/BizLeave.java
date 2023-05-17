package cn.coderliu.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;


/**
 * 请假对象
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BizLeave {

    /**
     * 主键ID
     */
    private String id;


    /**
     * 标题
     */
    private String title;

    /**
     * 原因
     */
    private String reason;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 请假时长，单位秒
     */
    private Long totalTime;

    /**
     * 流程实例ID
     */
    private String instanceId;

    /**
     * 申请人
     */
    private String applyUser;

    /**
     * 申请时间
     */
    private Date applyTime;

    /**
     * 实际开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date realityStartTime;

    /**
     * 实际结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date realityEndTime;
}
