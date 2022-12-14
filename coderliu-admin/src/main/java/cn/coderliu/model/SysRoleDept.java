package cn.coderliu.model;

import lombok.Data;

/**
 * 角色和部门关联表
 */
@Data
public class SysRoleDept {

    private String roleId;

    private String deptId;
}
