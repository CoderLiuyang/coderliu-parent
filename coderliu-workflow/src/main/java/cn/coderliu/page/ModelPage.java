package cn.coderliu.page;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;


/**
 * 模型分页的传参对象
 */
@Data
public class ModelPage extends Page {

    private String key;

    private String name;
}
