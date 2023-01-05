package cn.coderliu.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActReDeploymentVO {
    private String id;
    private Date deployTime;


}
