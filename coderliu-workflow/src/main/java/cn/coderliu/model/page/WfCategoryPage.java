package cn.coderliu.model.page;

import cn.coderliu.model.WfCategory;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程分类对象 wf_category
 *
 * @author KonBAI
 * @date 2022-01-15
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class WfCategoryPage extends Page<WfCategory> {


    /**
     * 分类ID
     */
    private String id;
    /**
     * 分类名称
     */
    private String categoryName;
    /**
     * 分类编码
     */
    private String code;
    /**
     * 备注
     */
    private String remark;

}
