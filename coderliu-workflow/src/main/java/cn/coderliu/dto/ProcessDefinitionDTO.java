package cn.coderliu.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProcessDefinitionDTO {


    private String id;

    private String name;

    private String key;

    private int version;

    private String deploymentId;
    private String resourceName;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date deploymentTime;


    /**
     * 流程实例状态 1 激活 2 挂起
     */
    private Integer suspendState;


}
