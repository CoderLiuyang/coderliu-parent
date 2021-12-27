package cn.coderliu.model;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @ClassName: SysUser
 * @Description:
 * @Author: liu
 * @Date: 2020/9/8 4:35 下午
 * @Version: V1.0
 **/
@Data
public class SysUser implements Serializable {
    private static final long serialVersionUID = -5886012896705137070L;
    private String id;

    private Integer code;

    private String username;

    private String password;

    private String mobile;

    private String nickname;

    private String headImgUrl;

    private Integer sex;

    private Boolean enabled;

    private Integer type;

    private String clientId;

    private LocalDateTime createdTime;

    private LocalDateTime updatedTime;
}
