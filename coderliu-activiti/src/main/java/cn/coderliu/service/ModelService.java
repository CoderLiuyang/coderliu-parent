package cn.coderliu.service;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.ModelDto;
import cn.coderliu.page.ModelPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.activiti.engine.repository.Model;

import java.io.UnsupportedEncodingException;

public interface ModelService {


    Page<Model> page(ModelPage modelPage);

    ReturnData<Void> save(ModelDto modelDto) throws Exception;

    ReturnData<Void> update(ModelDto modelDto, String modelId) throws Exception;

    ReturnData<Void> delete(String id);

    ReturnData<String> getJson(String id);

    ReturnData<Void> deployModel(String modelId);
}
