package cn.coderliu.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * 用户岗位表
 * @author liu
 * @since 2021-03-03
 */
@Data
public class SysUserPost  {

   private String userId;

   private String postId;
}
