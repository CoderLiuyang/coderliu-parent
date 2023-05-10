package cn.coderliu.model.dto;

import lombok.Data;


/**
 * 流程设计业务对象
 *
 * @author KonBAI
 * @createTime 2022/3/10 00:12
 */
@Data
public class WfDesignerDto {

    /**
     * 流程名称
     */
    private String name;

    /**
     * 流程分类
     */
    private String category;

    /**
     * XML字符串
     */
    private String xml;
}
