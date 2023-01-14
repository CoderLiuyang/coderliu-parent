package cn.coderliu.dto;


import lombok.Data;

/**
 * 审批对象
 */
@Data
public class CompleteDto {


    private String id;

    /**
     * 审批状态
     */
    private String approveStatus;

    /**
     * 审批意见
     */
    private String remark;
}
