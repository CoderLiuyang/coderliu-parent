package cn.coderliu.service;

import cn.coderliu.page.ModelPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

public interface ModelService {
    Page page(ModelPage modelPage);
}
