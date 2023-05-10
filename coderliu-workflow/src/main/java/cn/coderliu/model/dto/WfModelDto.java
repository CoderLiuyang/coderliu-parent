package cn.coderliu.model.dto;

import lombok.Data;

/**
 * 流程模型对象
 *
 * @author KonBAI
 * @createTime 2022/6/21 9:16
 */
@Data
public class WfModelDto {
    /**
     * 模型主键
     */
    private String modelId;
    /**
     * 模型名称
     */
    private String modelName;
    /**
     * 模型Key
     */
    private String modelKey;
    /**
     * 流程分类
     */
    private String category;
    /**
     * 描述
     */
    private String description;
    /**
     * 表单类型
     */
    private Integer formType;
    /**
     * 表单主键
     */
    private Long formId;
    /**
     * 流程xml
     */
    private String bpmnXml;
    /**
     * 是否保存为新版本
     */
    private Boolean newVersion;
}
