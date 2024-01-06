package cn.coderliu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 文件表
 *
 * @author liu
 * @since 2024-01-06
 */

@Data
@Builder
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class FileDataDto {

    private String id;


    /**
     * 业务id
     */
    private String busId;
    /**
     * 场景id
     */
    private String sceId;
    /**
     * 连接业务id
     */
    private String fileId;
    /**
     * 文件原名
     */
    private String realName;
    /**
     * 扩展名
     */
    private String extendName;
    /**
     * 存储的名
     */
    private String name;
}
