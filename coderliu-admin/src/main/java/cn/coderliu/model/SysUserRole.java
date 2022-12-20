package cn.coderliu.model;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

/**
 * 用户角色表
 *
 * @author liu
 * @since 2021-03-03
 */
@Data
public class SysUserRole {

    @TableId("user_id")
    private String userId;

    private String roleId;
}
