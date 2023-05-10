package cn.coderliu.model.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * 动态人员、组
 * @author KonBAI
 * @createTime 2022/3/10 00:12
 */
@Data
public class WfNextDto implements Serializable {

    private String type;

    private String vars;

//    private List<SysUser> userList;
//
//    private List<SysRole> roleList;
}
