package cn.coderliu.service;

import cn.coderliu.common.ReturnData;
import cn.coderliu.page.ModelPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.activiti.engine.repository.Model;

public interface ModelService {
    Page page(ModelPage modelPage);

    ReturnData save(Model modelPage);
}
