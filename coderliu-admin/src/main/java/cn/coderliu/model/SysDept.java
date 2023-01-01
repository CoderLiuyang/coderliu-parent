package cn.coderliu.model;

import lombok.Data;

/**
 * 部门实体
 */
@Data
public class SysDept extends BaseModel {


    private String pId;
    private String deptName;
    private Integer orderNum;
    private String leader;
    private String phone;
    private String email;
    private Boolean status;
}
