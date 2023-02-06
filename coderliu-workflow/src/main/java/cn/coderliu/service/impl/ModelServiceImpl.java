package cn.coderliu.service.impl;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.ModelDto;
import cn.coderliu.page.ModelPage;
import cn.coderliu.service.ModelService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.RequiredArgsConstructor;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * activiti模型的服务
 */
@Service
@RequiredArgsConstructor
public class ModelServiceImpl implements ModelService {

    private final RepositoryService repositoryService;

    @Override
    public Page page(ModelPage modelPage) {

        ModelQuery modelQuery = repositoryService.createModelQuery();
        modelQuery.orderByLastUpdateTime().desc();

        // 条件过滤
        if (StrUtil.isNotBlank(modelPage.getKey())) {
            modelQuery.modelKey(modelPage.getKey());
        }
        if (StrUtil.isNotBlank(modelPage.getName())) {
            modelQuery.modelNameLike("%" + modelPage.getName() + "%");
        }
        List<Model> list = modelQuery.listPage(Math.toIntExact((modelPage.getCurrent() - 1) * modelPage.getSize()),
                Math.toIntExact(modelPage.getSize()));
        return new Page()
                .setTotal(modelQuery.count())
                .setCurrent(modelPage.getCurrent())
                .setSize(modelPage.getSize())
                .setRecords(list);
    }

    @Override
    public ReturnData save(ModelDto modelDto) throws Exception {

        ObjectMapper objectMapper = new ObjectMapper();
        ObjectNode editorNode = objectMapper.createObjectNode();
        editorNode.put("id", "canvas");
        editorNode.put("resourceId", "canvas");
        ObjectNode stencilSetNode = objectMapper.createObjectNode();
        stencilSetNode.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
        editorNode.put("stencilset", stencilSetNode);

        ObjectNode modelObjectNode = objectMapper.createObjectNode();
        modelObjectNode.put("name", modelDto.getName());
        modelObjectNode.put("revision", 1);
        modelObjectNode.put("description", StringUtils.defaultString(modelDto.getDescription()));

        Model newModel = repositoryService.newModel();
        newModel.setMetaInfo(modelObjectNode.toString());
        newModel.setName(modelDto.getName());
        newModel.setKey(StringUtils.defaultString(modelDto.getKey()));

        repositoryService.saveModel(newModel);
        repositoryService.addModelEditorSource(newModel.getId(), editorNode.toString().getBytes("utf-8"));
        return ReturnData.succeed();
    }

    @Override
    public ReturnData delete(String id) {
        repositoryService.deleteModel(id);
        return ReturnData.succeed();
    }
}
