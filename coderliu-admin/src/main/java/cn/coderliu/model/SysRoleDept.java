package cn.coderliu.model;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 角色和部门关联表
 */
@Data
public class SysRoleDept {

    @TableId("role_id")
    private String roleId;

    private String deptId;
}
