package cn.coderliu.model;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户角色表
 *
 * @author liu
 * @since 2021-03-03
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SysUserRole extends Model<SysUserRole> {

    @TableId("user_id")
    private String userId;

    private String roleId;
}
