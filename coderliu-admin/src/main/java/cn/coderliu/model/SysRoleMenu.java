package cn.coderliu.model;

import lombok.Data;

/**
 * 角色和菜单关联表
 */
@Data
public class SysRoleMenu {

    private String roleId;

    private String menuId;
}
