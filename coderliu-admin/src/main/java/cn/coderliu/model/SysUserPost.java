package cn.coderliu.model;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.*;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * 用户岗位表
 *
 * @author liu
 * @since 2021-03-03
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SysUserPost extends Model<SysUserPost> {

    @TableId("user_id")
    private String userId;

    private String postId;
}
