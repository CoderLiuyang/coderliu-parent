package cn.coderliu.model.vo;

import lombok.Data;



/**
 * 流程分类视图对象 flow_category
 *
 * @author KonBAI
 * @date 2022-01-15
 */
@Data
public class WfCategoryVo {


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
