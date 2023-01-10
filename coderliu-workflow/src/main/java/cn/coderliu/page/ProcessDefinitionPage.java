package cn.coderliu.page;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

@Data
public class ProcessDefinitionPage extends Page {


    private String name;

    private String key;

    private String category;
}
