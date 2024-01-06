package cn.coderliu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 文件业务配置
 *
 * @author liu
 * @since 2024-01-06
 */

@Data
@Builder
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class FileBusinessParamDto {

    private String id;


    /**
     * 场景名字
     */
    private String busName;
}
