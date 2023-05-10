package cn.coderliu.model.page;

import cn.coderliu.model.WfForm;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程表单业务对象
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class WfFormPage extends Page<WfForm> {

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
