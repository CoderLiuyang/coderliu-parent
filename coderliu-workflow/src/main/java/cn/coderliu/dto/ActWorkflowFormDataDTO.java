package cn.coderliu.dto;


import lombok.Data;

/**
 * 动态单对象 act_workflow_formdata
 *
 * @author danny
 * @date 2020-11-01
 */
@Data
public class ActWorkflowFormDataDTO {
    private static final long serialVersionUID = 1L;


    /**
     * 表单id
     */
    private String controlId;
    private String controlType;


    /**
     * 表单名称
     */
    private String controlLable;

    private String controlIsParam;

    /**
     * 表单值
     */
    private String controlValue;
    private String controlDefault;



}
