package cn.coderliu.model;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: Client
 * @Description:
 * @Author: liu
 * @Date: 2020/9/8 3:54 下午
 * @Version: V1.0
 **/
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("oauth_client_details")
public class Client implements Serializable {
    private static final long serialVersionUID = -8185413579135897885L;
    @TableId
    private Long id;
    /**
     * 应用标识
     */
    private String clientId;
    /**
     * 应用名称
     */
    private String clientName;
    /**
     * 资源限定串
     */
    private String resourceIds = "";

    /**
     * 应用密钥(bcyt) 加密
     */
    private String clientSecret;

    /**
     * 应用密钥(明文)
     */
    private String clientSecretStr;
    /**
     * 范围
     */
    private String scope = "all";
    /**
     * oauth授权方式
     */
    private String authorizedGrantTypes = "authorization_code,password,refresh_token,client_credentials";
    /**
     * 回调地址
     */
    private String webServerRedirectUri;
    /**
     * 权限
     */
    private String authorities = "";
    @TableField(value = "access_token_validity")
    /**
     *  access_token有效期
     */
    private Integer accessTokenValiditySeconds = 18000;
    @TableField(value = "refresh_token_validity")
    /**
     * refresh_token有效期
     */
    private Integer refreshTokenValiditySeconds = 28800;
    private String additionalInformation = "{}";
    /**
     * 是否自动授权
     */
    private String autoapprove = "true";
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;
}
