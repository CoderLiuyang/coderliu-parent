//package cn.coderliu.service.impl;
//
//import cn.coderliu.common.core.FlowServiceFactory;
//import cn.coderliu.common.enums.FormType;
//import cn.coderliu.model.dto.WfMetaInfoDto;
//import cn.coderliu.model.dto.WfModelDto;
//import cn.coderliu.model.vo.WfFormVo;
//import cn.coderliu.model.vo.WfModelVo;
//import cn.coderliu.service.IWfDeployFormService;
//import cn.coderliu.service.IWfFormService;
//import cn.coderliu.service.IWfModelService;
//import cn.hutool.core.util.ObjectUtil;
//import cn.hutool.core.util.StrUtil;
//import com.alibaba.fastjson.JSON;
//import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.flowable.bpmn.model.BpmnModel;
//import org.flowable.bpmn.model.StartEvent;
//import org.flowable.engine.repository.Deployment;
//import org.flowable.engine.repository.Model;
//import org.flowable.engine.repository.ModelQuery;
//import org.flowable.engine.repository.ProcessDefinition;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.nio.charset.StandardCharsets;
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.List;
//
///**
// * @author KonBAI
// * @createTime 2022/6/21 9:11
// */
//@RequiredArgsConstructor
//@Service
//@Slf4j
//public class WfModelServiceImpl extends FlowServiceFactory implements IWfModelService {
//
//    private final IWfFormService formService;
//    private final IWfDeployFormService deployFormService;
//
//    @Override
//    public Page<WfModelVo> list(WfModelDto modelBo, PageQuery pageQuery) {
//        ModelQuery modelQuery = repositoryService.createModelQuery().latestVersion().orderByCreateTime().desc();
//        // 构建查询条件
//        if (StrUtil.isNotBlank(modelBo.getModelKey())) {
//            modelQuery.modelKey(modelBo.getModelKey());
//        }
//        if (StrUtil.isNotBlank(modelBo.getModelName())) {
//            modelQuery.modelNameLike("%" + modelBo.getModelName() + "%");
//        }
//        if (StrUtil.isNotBlank(modelBo.getCategory())) {
//            modelQuery.modelCategory(modelBo.getCategory());
//        }
//        // 执行查询
//        long pageTotal = modelQuery.count();
//        if (pageTotal <= 0) {
//            return ReturnData.succeed();
//        }
//        int offset = pageQuery.getPageSize() * (pageQuery.getPageNum() - 1);
//        List<Model> modelList = modelQuery.listPage(offset, pageQuery.getPageSize());
//        List<WfModelVo> modelVoList = new ArrayList<>(modelList.size());
//        modelList.forEach(model -> {
//            WfModelVo modelVo = new WfModelVo();
//            modelVo.setModelId(model.getId());
//            modelVo.setModelName(model.getName());
//            modelVo.setModelKey(model.getKey());
//            modelVo.setCategory(model.getCategory());
//            modelVo.setCreateTime(model.getCreateTime());
//            modelVo.setVersion(model.getVersion());
//            WfMetaInfoDto metaInfo = JsonUtils.parseObject(model.getMetaInfo(), WfMetaInfoDto.class);
//            if (metaInfo != null) {
//                modelVo.setDescription(metaInfo.getDescription());
//                modelVo.setFormType(metaInfo.getFormType());
//                modelVo.setFormId(metaInfo.getFormId());
//            }
//            modelVoList.add(modelVo);
//        });
//        Page<WfModelVo> page = new Page<>();
//        page.setRecords(modelVoList);
//        page.setTotal(pageTotal);
//        return ReturnData.succeed(page);
//    }
//
//    @Override
//    public List<WfModelVo> list(WfModelBo modelBo) {
//        ModelQuery modelQuery = repositoryService.createModelQuery().latestVersion().orderByCreateTime().desc();
//        // 构建查询条件
//        if (StrUtil.isNotBlank(modelBo.getModelKey())) {
//            modelQuery.modelKey(modelBo.getModelKey());
//        }
//        if (StrUtil.isNotBlank(modelBo.getModelName())) {
//            modelQuery.modelNameLike("%" + modelBo.getModelName() + "%");
//        }
//        if (StrUtil.isNotBlank(modelBo.getCategory())) {
//            modelQuery.modelCategory(modelBo.getCategory());
//        }
//        List<Model> modelList = modelQuery.list();
//        List<WfModelVo> modelVoList = new ArrayList<>(modelList.size());
//        modelList.forEach(model -> {
//            WfModelVo modelVo = new WfModelVo();
//            modelVo.setModelId(model.getId());
//            modelVo.setModelName(model.getName());
//            modelVo.setModelKey(model.getKey());
//            modelVo.setCategory(model.getCategory());
//            modelVo.setCreateTime(model.getCreateTime());
//            modelVo.setVersion(model.getVersion());
//            WfMetaInfoDto metaInfo = JsonUtils.parseObject(model.getMetaInfo(), WfMetaInfoDto.class);
//            if (metaInfo != null) {
//                modelVo.setDescription(metaInfo.getDescription());
//                modelVo.setFormType(metaInfo.getFormType());
//                modelVo.setFormId(metaInfo.getFormId());
//            }
//            modelVoList.add(modelVo);
//        });
//        return modelVoList;
//    }
//
//    @Override
//    public TableDataInfo<WfModelVo> historyList(WfModelBo modelBo, PageQuery pageQuery) {
//        ModelQuery modelQuery = repositoryService.createModelQuery()
//            .modelKey(modelBo.getModelKey())
//            .orderByModelVersion()
//            .desc();
//        // 执行查询（不显示最新版，-1）
//        long pageTotal = modelQuery.count() - 1;
//        if (pageTotal <= 0) {
//            return ReturnData.succeed();
//        }
//        // offset+1，去掉最新版
//        int offset = 1 + pageQuery.getPageSize() * (pageQuery.getPageNum() - 1);
//        List<Model> modelList = modelQuery.listPage(offset, pageQuery.getPageSize());
//        List<WfModelVo> modelVoList = new ArrayList<>(modelList.size());
//        modelList.forEach(model -> {
//            WfModelVo modelVo = new WfModelVo();
//            modelVo.setModelId(model.getId());
//            modelVo.setModelName(model.getName());
//            modelVo.setModelKey(model.getKey());
//            modelVo.setCategory(model.getCategory());
//            modelVo.setCreateTime(model.getCreateTime());
//            modelVo.setVersion(model.getVersion());
//            WfMetaInfoDto metaInfo = JsonUtils.parseObject(model.getMetaInfo(), WfMetaInfoDto.class);
//            if (metaInfo != null) {
//                modelVo.setDescription(metaInfo.getDescription());
//                modelVo.setFormType(metaInfo.getFormType());
//                modelVo.setFormId(metaInfo.getFormId());
//            }
//            modelVoList.add(modelVo);
//        });
//        Page<WfModelVo> page = new Page<>();
//        page.setRecords(modelVoList);
//        page.setTotal(pageTotal);
//        return ReturnData.succeed(page);
//    }
//
//    @Override
//    public WfModelVo getModel(String modelId) {
//        // 获取流程模型
//        Model model = repositoryService.getModel(modelId);
//        if (ObjectUtil.isNull(model)) {
//            throw new RuntimeException("流程模型不存在！");
//        }
//        // 获取流程图
//        String bpmnXml = queryBpmnXmlById(modelId);
//        WfModelVo modelVo = new WfModelVo();
//        modelVo.setModelId(model.getId());
//        modelVo.setModelName(model.getName());
//        modelVo.setModelKey(model.getKey());
//        modelVo.setCategory(model.getCategory());
//        modelVo.setCreateTime(model.getCreateTime());
//        modelVo.setVersion(model.getVersion());
//        modelVo.setBpmnXml(bpmnXml);
//        WfMetaInfoDto metaInfo = JSON.parseObject(model.getMetaInfo(), WfMetaInfoDto.class);
//        if (metaInfo != null) {
//            modelVo.setDescription(metaInfo.getDescription());
//            modelVo.setFormType(metaInfo.getFormType());
//            modelVo.setFormId(metaInfo.getFormId());
//            if (FormType.PROCESS.getType().equals(metaInfo.getFormType())) {
//                WfFormVo wfFormVo = formService.queryById(metaInfo.getFormId());
//                modelVo.setContent(wfFormVo.getContent());
//            }
//        }
//        return modelVo;
//    }
//
//    @Override
//    public String queryBpmnXmlById(String modelId) {
//        byte[] bpmnBytes = repositoryService.getModelEditorSource(modelId);
//        return StrUtil.utf8Str(bpmnBytes);
//    }
//
//    @Override
//    public void insertModel(WfModelBo modelBo) {
//        Model model = repositoryService.newModel();
//        model.setName(modelBo.getModelName());
//        model.setKey(modelBo.getModelKey());
//        model.setCategory(modelBo.getCategory());
//        String metaInfo = buildMetaInfo(new WfMetaInfoDto(), modelBo.getDescription());
//        model.setMetaInfo(metaInfo);
//        // 保存流程模型
//        repositoryService.saveModel(model);
//    }
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public void updateModel(WfModelBo modelBo) {
//        // 根据模型Key查询模型信息
//        Model model = repositoryService.getModel(modelBo.getModelId());
//        if (ObjectUtil.isNull(model)) {
//            throw new RuntimeException("流程模型不存在！");
//        }
//        model.setCategory(modelBo.getCategory());
//        WfMetaInfoDto metaInfoDto = JsonUtils.parseObject(model.getMetaInfo(), WfMetaInfoDto.class);
//        String metaInfo = buildMetaInfo(metaInfoDto, modelBo.getDescription());
//        model.setMetaInfo(metaInfo);
//        // 保存流程模型
//        repositoryService.saveModel(model);
//    }
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public void saveModel(WfModelBo modelBo) {
//        // 查询模型信息
//        Model model = repositoryService.getModel(modelBo.getModelId());
//        if (ObjectUtil.isNull(model)) {
//            throw new RuntimeException("流程模型不存在！");
//        }
//        BpmnModel bpmnModel = ModelUtils.getBpmnModel(modelBo.getBpmnXml());
//        if (ObjectUtil.isEmpty(bpmnModel)) {
//            throw new RuntimeException("获取模型设计失败！");
//        }
//        String processName = bpmnModel.getMainProcess().getName();
//        // 获取开始节点
//        StartEvent startEvent = ModelUtils.getStartEvent(bpmnModel);
//        if (ObjectUtil.isNull(startEvent)) {
//            throw new RuntimeException("开始节点不存在，请检查流程设计是否有误！");
//        }
//        // 获取开始节点配置的表单Key
//        if (StrUtil.isBlank(startEvent.getFormKey())) {
//            throw new RuntimeException("请配置流程表单");
//        }
//        Model newModel;
//        if (Boolean.TRUE.equals(modelBo.getNewVersion())) {
//            newModel = repositoryService.newModel();
//            newModel.setName(processName);
//            newModel.setKey(model.getKey());
//            newModel.setCategory(model.getCategory());
//            newModel.setMetaInfo(model.getMetaInfo());
//            newModel.setVersion(model.getVersion() + 1);
//        } else {
//            newModel = model;
//            // 设置流程名称
//            newModel.setName(processName);
//        }
//        // 保存流程模型
//        repositoryService.saveModel(newModel);
//        // 保存 BPMN XML
//        byte[] bpmnXmlBytes = StrUtil.getBytes(modelBo.getBpmnXml(), StandardCharsets.UTF_8);
//        repositoryService.addModelEditorSource(newModel.getId(), bpmnXmlBytes);
//    }
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public void latestModel(String modelId) {
//        // 获取流程模型
//        Model model = repositoryService.getModel(modelId);
//        if (ObjectUtil.isNull(model)) {
//            throw new RuntimeException("流程模型不存在！");
//        }
//        Integer latestVersion = repositoryService.createModelQuery()
//            .modelKey(model.getKey())
//            .latestVersion()
//            .singleResult()
//            .getVersion();
//        if (model.getVersion().equals(latestVersion)) {
//            throw new RuntimeException("当前版本已是最新版！");
//        }
//        // 获取 BPMN XML
//        byte[] bpmnBytes = repositoryService.getModelEditorSource(modelId);
//        Model newModel = repositoryService.newModel();
//        newModel.setName(model.getName());
//        newModel.setKey(model.getKey());
//        newModel.setCategory(model.getCategory());
//        newModel.setMetaInfo(model.getMetaInfo());
//        newModel.setVersion(latestVersion + 1);
//        // 保存流程模型
//        repositoryService.saveModel(newModel);
//        // 保存 BPMN XML
//        repositoryService.addModelEditorSource(newModel.getId(), bpmnBytes);
//    }
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public void deleteByIds(Collection<String> ids) {
//        ids.forEach(id -> {
//            Model model = repositoryService.getModel(id);
//            if (ObjectUtil.isNull(model)) {
//                throw new RuntimeException("流程模型不存在！");
//            }
//            repositoryService.deleteModel(id);
//        });
//    }
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public boolean deployModel(String modelId) {
//        // 获取流程模型
//        Model model = repositoryService.getModel(modelId);
//        if (ObjectUtil.isNull(model)) {
//            throw new RuntimeException("流程模型不存在！");
//        }
//        // 获取流程图
//        byte[] bpmnBytes = repositoryService.getModelEditorSource(modelId);
//        String bpmnXml = StrUtil.toEncodedString(bpmnBytes, StandardCharsets.UTF_8);
//        BpmnModel bpmnModel = ModelUtils.getBpmnModel(bpmnXml);
//        String processName = model.getName() + ProcessConstants.SUFFIX;
//        // 部署流程
//        Deployment deployment = repositoryService.createDeployment()
//            .name(model.getName())
//            .key(model.getKey())
//            .category(model.getCategory())
//            .addBytes(processName, bpmnBytes)
//            .deploy();
//        ProcessDefinition procDef = repositoryService.createProcessDefinitionQuery()
//            .deploymentId(deployment.getId())
//            .singleResult();
//        // 修改流程定义的分类，便于搜索流程
//        repositoryService.setProcessDefinitionCategory(procDef.getId(), model.getCategory());
//        // 保存部署表单
//        return deployFormService.saveInternalDeployForm(deployment.getId(), bpmnModel);
//    }
//
//    /**
//     * 构建模型扩展信息
//     * @return
//     */
//    private String buildMetaInfo(WfMetaInfoDto metaInfo, String description) {
//        // 只有非空，才进行设置，避免更新时的覆盖
//        if (StrUtil.isNotEmpty(description)) {
//            metaInfo.setDescription(description);
//        }
//        if (StrUtil.isNotEmpty(metaInfo.getCreateUser())) {
//            metaInfo.setCreateUser(LoginHelper.getUsername());
//        }
//        return JsonUtils.toJsonString(metaInfo);
//    }
//}
