package cn.coderliu.model;

import cn.coderliu.dto.ActWorkflowFormDataDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.activiti.api.task.model.Task;

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
    public ActWorkflowFormData(String businessKey, ActWorkflowFormDataDTO actWorkflowFormDataDTO, Task task) {
        this.businessKey = businessKey;
        this.formKey = task.getFormKey();
        this.controlId = actWorkflowFormDataDTO.getControlId();
        this.controlName = actWorkflowFormDataDTO.getControlLable();
        if ("radio".equals(actWorkflowFormDataDTO.getControlType())) {
            int i = Integer.parseInt(actWorkflowFormDataDTO.getControlValue());
            this.controlValue =  actWorkflowFormDataDTO.getControlDefault().split("--__--")[i];
        }else {
            this.controlValue = actWorkflowFormDataDTO.getControlValue();
        }
        this.taskNodeName = task.getName();
    }

}
