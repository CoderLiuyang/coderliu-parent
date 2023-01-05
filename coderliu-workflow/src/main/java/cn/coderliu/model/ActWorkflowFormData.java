package cn.coderliu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 动态单对象 act_workflow_formdata
 *
 * @author danny
 * @date 2020-11-02
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ActWorkflowFormData {

    /**
     * 唯一标识符
     */
    private Long id;

    /**
     * 事务Id
     */
    private String businessKey;

    /**
     * 表单Key
     */
    private String formKey;


    /**
     * 表单id
     */
    private String controlId;
    /**
     * 表单名称
     */
    private String controlName;

    /**
     * 表单值
     */
    private String controlValue;

    /**
     * 任务节点名称
     */
    private String taskNodeName;

    private String createName;


}
