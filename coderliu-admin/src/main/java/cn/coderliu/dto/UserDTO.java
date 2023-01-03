package cn.coderliu.dto;

import cn.coderliu.model.SysUser;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class UserDTO extends SysUser {

	/**
	 * 角色ID
	 */
	private List<String> role;


	/**
	 * 岗位ID
	 */
	private List<String> post;

	/**
	 * 新密码
	 */
	private String newpassword1;

	/**
	 * 验证码
	 */
	private String code;

}
