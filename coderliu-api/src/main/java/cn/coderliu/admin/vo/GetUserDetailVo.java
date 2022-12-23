package cn.coderliu.admin.vo;

import cn.coderliu.admin.vo.detail.RoleVo;
import lombok.*;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class GetUserDetailVo {

    private String id;

    private String deptId;


    private String userName;

    private String passWord;

    private String phone;

    /**
     * 是否启用
     */
    private Boolean status;


    private List<RoleVo> roles;

    private Boolean isAdmin;

    private List<String> permissions = new ArrayList<>();

    private List<String> post = new ArrayList<>();


}