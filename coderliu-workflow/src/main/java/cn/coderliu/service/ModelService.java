package cn.coderliu.service;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.ModelDto;
import cn.coderliu.page.ModelPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.activiti.engine.repository.Model;

import java.io.UnsupportedEncodingException;

public interface ModelService {
    Page page(ModelPage modelPage);

    ReturnData save(ModelDto modelDto) throws Exception;

    ReturnData delete(String id);

    ReturnData getJson(String id);
}
