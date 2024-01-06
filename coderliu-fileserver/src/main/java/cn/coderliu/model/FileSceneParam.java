package cn.coderliu.model;

import lombok.*;

/**
 * 文件场景配置
 *
 * @author liu
 * @since 2024-01-06
 */

@Data
@EqualsAndHashCode(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FileSceneParam extends BaseModel {
    /**
     * 业务ID
     */
    private String busId;
    /**
     * 场景名字
     */
    private String sceneName;
    /**
     * 场景配置
     */
    private String sceneOps;
}
