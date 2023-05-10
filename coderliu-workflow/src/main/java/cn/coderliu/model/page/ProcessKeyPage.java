package cn.coderliu.model.page;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 业务key分页对象
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ProcessKeyPage extends Page {

    private String processKey;
}
