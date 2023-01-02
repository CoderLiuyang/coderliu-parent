package cn.coderliu.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 字典项
 *
 * @author lengleng
 * @date 2019/03/19
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SysDictItem extends BaseModel {


    /**
     * 所属字典类id
     */
    private String dictId;

    /**
     * 所属字典类id
     */
    private String dictKey;

    /**
     * 数据值
     */
    private String value;

    /**
     * 标签名
     */
    private String label;

    /**
     * 类型
     */
    private String type;

    /**
     * 描述
     */
    private String description;


    private Integer orderNum;

    /**
     * 备注信息
     */
    private String remark;


}
