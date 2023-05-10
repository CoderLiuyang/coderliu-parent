package cn.coderliu.model;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * 流程分类对象 wf_category
 *
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("wf_category")
public class WfCategory extends BaseModel {


    /**
     * 分类名称
     */
    @NotBlank(message = "分类名称不能为空")
    private String categoryName;
    /**
     * 分类编码
     */
    @NotBlank(message = "分类编码不能为空")
    private String code;
    /**
     * 备注
     */
    private String remark;

}
