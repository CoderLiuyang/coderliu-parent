package cn.coderliu.admin.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class GetUserDetailVo {

    private String userName;

    private String passWord;

    private List<String> roles;

    private List<String> permissions;

    private List<String> post;
}
