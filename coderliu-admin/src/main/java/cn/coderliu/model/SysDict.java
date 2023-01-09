package cn.coderliu.model;

import lombok.Data;

/**
 * 字典表
 *
 * @author lengleng
 * @date 2019/03/19
 */
@Data
public class SysDict extends BaseModel {


    /**
     * 类型
     */
    private String dictKey;

    /**
     * 描述
     */
    private String description;

    /**
     * 是否是系统内置
     */
    private String systemFlag;

    /**
     * 备注信息
     */
    private String remark;


}
