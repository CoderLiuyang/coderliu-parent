package cn.coderliu.admin.vo.detail;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public  class RoleVo {

    private String id;

    private String name;
    private String roleKey;

    private String dataScope;
}
