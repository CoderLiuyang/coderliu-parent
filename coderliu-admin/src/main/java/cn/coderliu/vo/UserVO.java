package cn.coderliu.vo;

import cn.coderliu.model.SysPost;
import cn.coderliu.model.SysRole;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


@Data
public class UserVO implements Serializable {

    private String id;
    private String userName;
    private String phone;
    private String avatar;
    private String deptId;
    private Date createTime;
    private Date updateTime;
    private Boolean delFlag;
    private String status;
    private String deptName;

    private List<SysRole> roleList;

    private List<SysPost> postList;
}
