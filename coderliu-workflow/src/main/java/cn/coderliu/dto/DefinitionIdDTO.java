package cn.coderliu.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.activiti.engine.repository.ProcessDefinition;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class DefinitionIdDTO {
    private String deploymentID;
    private String resourceName;

    public DefinitionIdDTO(ProcessDefinition processDefinition) {
        this.deploymentID = processDefinition.getDeploymentId();
        this.resourceName = processDefinition.getResourceName();
    }
}
