package cn.coderliu.model;

import lombok.*;

/**
 * 文件表
 *
 * @author liu
 * @since 2024-01-06
 */

@Data
@EqualsAndHashCode(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FileData extends BaseModel {
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
