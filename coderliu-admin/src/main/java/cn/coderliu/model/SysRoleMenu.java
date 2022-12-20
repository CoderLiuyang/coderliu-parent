package cn.coderliu.model;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 角色和菜单关联表
 */
@Data
public class SysRoleMenu {
    @TableId("role_id")
    private String roleId;

    private String menuId;
}
