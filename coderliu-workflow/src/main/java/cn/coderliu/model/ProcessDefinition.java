package cn.coderliu.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 流程定义
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProcessDefinition {


    private String id;

    /**
     * 流程名称
     **/
    private String name;

    /**
     * 流程KEY
     **/
    private String key;

    /**
     * 流程版本
     **/
    private int version;

    /**
     * 所属分类
     **/
    private String category;

    /**
     * 流程描述
     **/
    private String description;

    private String deploymentId;

    /**
     * 部署时间", dateFormat = "yyyy-MM-dd HH:mm:ss
     **/
    private Date deploymentTime;

    /**
     * 流程图
     **/
    private String diagramResourceName;

    /**
     * 流程定义
     **/
    private String resourceName;

    /**
     * 流程实例状态 1 激活 2 挂起
     */
    private String suspendState;

    private String suspendStateName;

}
