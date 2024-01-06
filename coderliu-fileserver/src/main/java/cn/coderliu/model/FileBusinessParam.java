package cn.coderliu.model;

import lombok.*;

/**
 * 文件业务配置
 *
 * @author liu
 * @since 2024-01-06
 */

@Data
@EqualsAndHashCode(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FileBusinessParam extends BaseModel {
    /**
     * 场景名字
     */
    private String busName;
}
