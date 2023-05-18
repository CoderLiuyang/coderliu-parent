package cn.coderliu.service.impl;

import cn.coderliu.common.ReturnData;
import cn.coderliu.constant.ProcessConstants;
import cn.coderliu.dto.ModelDto;
import cn.coderliu.page.ModelPage;
import cn.coderliu.service.ModelService;
import cn.coderliu.utils.ModelUtils;
import cn.coderliu.utils.SecurityUtils;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.ActivitiException;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;

/**
 * activiti模型的服务
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class ModelServiceImpl implements ModelService {

    private final RepositoryService repositoryService;


    private final ObjectMapper objectMapper;


    @Override
    public Page<Model> page(ModelPage modelPage) {

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
        return new Page(modelPage.getCurrent(), modelPage.getSize())
                .setTotal(modelQuery.count())
                .setRecords(list);
    }

    @Override
    public ReturnData<Void> save(ModelDto modelDto) throws Exception {
        Model model = repositoryService.newModel();
        model.setName(modelDto.getName());
        model.setKey(modelDto.getKey());
        //  model.setCategory(modelBo.getCategory());
        model.setMetaInfo(JSON.toJSONString(new HashMap<String, Object>() {{
            put("description", modelDto.getDescription());
            put("createdBy", SecurityUtils.getUser().getName());
        }}));
        // 保存流程模型
        repositoryService.saveModel(model);
        //增加默认的xml

        return ReturnData.succeed();
    }

    @Override
    public ReturnData<Void> update(ModelDto modelDto, String modelId) throws Exception {
        try {
//            Model model = repositoryService.getModel(modelId);
//            ObjectNode modelJson = (ObjectNode) objectMapper.readTree(model.getMetaInfo());
//            modelJson.put("name", modelDto.getName());
//            modelJson.put("description", modelDto.getDescription());
//            model.setMetaInfo(modelJson.toString());
//            model.setName(modelDto.getName());
//            repositoryService.saveModel(model);
            repositoryService.addModelEditorSource(modelId, modelDto.getDescription().getBytes(StandardCharsets.UTF_8));
            // repositoryService.addModelEditorSourceExtra(model.getId(), modelDto.getDescription().getBytes(StandardCharsets.UTF_8));
        } catch (Exception e) {
            log.error("Error saving model", e);
            throw new ActivitiException("Error saving model", e);
        }
        return ReturnData.succeed();
    }

    @Override
    public ReturnData<Void> delete(String id) {
        repositoryService.deleteModel(id);
        return ReturnData.succeed();
    }

    @Override
    public ReturnData<String> getJson(String modelId) {
        final byte[] source = repositoryService.getModelEditorSource(modelId);
        if (source == null) {
            return ReturnData.succeed("", "");
        }
        return ReturnData.succeed(new String(repositoryService.getModelEditorSource(modelId),
                StandardCharsets.UTF_8), "查询成功");
    }


    public ReturnData<Void> deployModel(String modelId) {
        // 获取流程模型
        Model model = repositoryService.getModel(modelId);
        if (ObjectUtil.isNull(model)) {
            throw new RuntimeException("流程模型不存在！");
        }
        // 获取流程图
        byte[] bpmnBytes = repositoryService.getModelEditorSource(modelId);
        String bpmnXml = new String(bpmnBytes, StandardCharsets.UTF_8);
        BpmnModel bpmnModel = ModelUtils.getBpmnModel(bpmnXml);
        String processName = model.getName() + ProcessConstants.SUFFIX;
        // 部署流程
        Deployment deployment = repositoryService.createDeployment()
                .name(model.getName())
                .key(model.getKey())
                // .category(model.getCategory())
                .addBytes(processName, bpmnBytes)
                .deploy();
//        ProcessDefinition procDef = repositoryService.createProcessDefinitionQuery()
//                .deploymentId(deployment.getId())
//                .singleResult();
        // 修改流程定义的分类，便于搜索流程
        //     repositoryService.setProcessDefinitionCategory(procDef.getId(), model.getCategory());
        // 保存部署表单
        //  return deployFormService.saveInternalDeployForm(deployment.getId(), bpmnModel);
        return ReturnData.succeed();
    }
}


