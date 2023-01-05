package cn.coderliu.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 汇讯数码科技(深圳)有限公司
 * 创建日期:2020/11/3-14:02
 * 版本   开发者     日期
 * 1.0    Danny    2020/11/3
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class HistoryFormDataDTO {
    private String title;
    private String value;

}