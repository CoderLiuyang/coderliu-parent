package cn.coderliu.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 岗位
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Builder
@Accessors(chain = true)
@AllArgsConstructor
public class SysPost extends BaseModel {

    /**
     * 岗位编码
     */
    private String postCode;

    /**
     * 岗位名称
     */
    private String postName;

    /**
     * 岗位排序
     */
    private Integer postSort;

    /**
     * 状态（1正常 0停用）
     */
    private Boolean status;

    private String remark;
}
