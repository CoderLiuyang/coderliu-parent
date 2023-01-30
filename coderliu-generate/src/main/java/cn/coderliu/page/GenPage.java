package cn.coderliu.page;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

/**
 *
 * 代码生成分页查表
 */
@Data
public class GenPage extends Page {


    /**
     * 表名
     */
    private String tableName;

    /**
     * 数据源名称
     */
    private String dsName;
}
