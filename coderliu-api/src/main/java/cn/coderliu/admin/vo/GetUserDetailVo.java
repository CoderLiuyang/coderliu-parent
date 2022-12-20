package cn.coderliu.admin.vo;

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


    private List<String> roles;

    private List<String> permissions = new ArrayList<>();

    private List<String> post = new ArrayList<>();
}
