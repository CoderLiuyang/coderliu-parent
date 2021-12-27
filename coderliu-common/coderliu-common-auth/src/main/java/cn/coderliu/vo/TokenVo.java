package cn.coderliu.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TokenVo
 * @Description:
 * @Author: liu
 * @Date: 2020/9/16 11:32 上午
 * @Version: V1.0
 **/
@Data
public class TokenVo implements Serializable {
    /**
     * token的值
     */
    private String tokenValue;
    /**
     * 到期时间
     */
    private Date expiration;
    /**
     * 用户名
     */
    private String username;
    /**
     * 所属应用
     */
    private String clientId;
    /**
     * 授权类型
     */
    private String grantType;
}
