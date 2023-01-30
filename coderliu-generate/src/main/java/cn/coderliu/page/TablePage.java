package cn.coderliu.page;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

@Data
public class TablePage extends Page {

    /**
     * 数据源名称
     */
    private String dsName;
}
