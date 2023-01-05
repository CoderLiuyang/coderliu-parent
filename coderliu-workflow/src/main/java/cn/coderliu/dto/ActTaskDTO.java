package cn.coderliu.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ActTaskDTO {

    private static final long serialVersionUID = 1L;

    private String id;

    private String name;

    private String status;

    private Date createDate;
    private String instanceName;
    private String definitionKey;
    private String businessKey;


}
