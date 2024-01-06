package cn.coderliu.page;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 文件场景配置 分页对象
 *
 * @author liu
 * @since 2024-01-06
 */

@Data
@Builder
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class FileSceneParamPage extends Page {

    private String id;

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
