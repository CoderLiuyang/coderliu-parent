package cn.coderliu.model;

import lombok.*;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author liu
 * @since 2021-03-03
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Builder
@Accessors(chain = true)
@AllArgsConstructor
public class SysUser extends BaseModel {

    /**
     * 部门id
     */
    private String deptId;
    /**
     * 登录账号
     */
    private String loginName;
    /**
     * 用户昵称
     */
    private String userName;
    /**
     * 用户邮箱
     */
    private String email;
    /**
     * 手机号码
     */
    private String phone;
    /**
     * 用户性别（0男 1女 2未知）
     */
    private String sex;
    /**
     * 头像路径
     */
    private String avatar;
    /**
     * 密码
     */
    private String password;
    /**
     * 盐加密
     */
    private String salt;
    /**
     * 帐号状态（1正常 0停用）
     */
    private Boolean status;
    /**
     * 最后登录IP
     */
    private String loginIp;
    /**
     * 最后登录
     */
    private Date loginDate;
    /**
     * 密码最后更新时间
     */
    private Date pwdUpdateDate;
    /**
     * 备注
     */
    private String remark;

}
