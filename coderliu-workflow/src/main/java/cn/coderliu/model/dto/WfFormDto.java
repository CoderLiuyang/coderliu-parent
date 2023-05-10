package cn.coderliu.model.dto;

import cn.coderliu.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程表单业务对象
 *
 * @author KonBAI
 * @createTime 2022/3/7 22:07
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class WfFormDto extends BaseModel {

    /**
     * 表单主键
     */
    private String id;

    /**
     * 表单名称
     */
    private String formName;

    /**
     * 表单内容
     */
    private String content;

    /**
     * 备注
     */
    private String remark;
}
