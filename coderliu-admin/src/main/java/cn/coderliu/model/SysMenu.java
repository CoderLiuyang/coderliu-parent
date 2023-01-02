package cn.coderliu.model;

import lombok.*;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@EqualsAndHashCode(callSuper = true)
@Builder
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class SysMenu extends BaseModel{



    /** 菜单名称 */
    @NotBlank(message = "菜单名称不能为空")
    private String menuName;


    /** 父菜单ID */
    @NotNull(message = "菜单父ID不能为空")
    private String pId;

    /** 显示顺序 */
    private String orderNum;

    /** 菜单URL */
    private String url;

    /** 打开方式（menuItem页签 menuBlank新窗口） */
    private String target;

    @NotNull(message = "菜单类型不能为空")
    private String menuType;

    /** 菜单状态（1显示 0隐藏） */
    private Boolean visible;

    /**
     * 路由缓冲
     */
    private String keepAlive;


    /** 权限字符串 */
    private String perms;

    /** 菜单图标 */
    private String icon;
    /**
     * 备注
     */
    private String remark;
}
