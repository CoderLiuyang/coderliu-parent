package cn.coderliu.service.impl;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.ModelDto;
import cn.coderliu.page.ModelPage;
import cn.coderliu.service.ModelService;
import cn.coderliu.utils.SecurityUtils;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.activiti.engine.ActivitiException;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.batik.transcoder.image.PNGTranscoder;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
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
        return ReturnData.succeed();
    }

    @Override
    public ReturnData<Void> update(ModelDto modelDto, String modelId) throws Exception {
        try {

            Model model = repositoryService.getModel(modelId);

            ObjectNode modelJson = (ObjectNode) objectMapper.readTree(model.getMetaInfo());

            modelJson.put("name", modelDto.getName());
            modelJson.put("description", modelDto.getDescription());
            model.setMetaInfo(modelJson.toString());
            model.setName(modelDto.getName());

            repositoryService.saveModel(model);

            repositoryService.addModelEditorSource(model.getId(), modelDto.getDescription().getBytes(StandardCharsets.UTF_8));

//            InputStream svgStream = new ByteArrayInputStream(values.getFirst("svg_xml").getBytes(StandardCharsets.UTF_8));
//            TranscoderInput input = new TranscoderInput(svgStream);
//
//            PNGTranscoder transcoder = new PNGTranscoder();
//            // Setup output
//            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
//            TranscoderOutput output = new TranscoderOutput(outStream);
//
//            // Do the transformation
//            transcoder.transcode(input, output);
//            final byte[] result = outStream.toByteArray();
//            repositoryService.addModelEditorSourceExtra(model.getId(), result);
//            outStream.close();

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
        if (source == null){
            return  ReturnData.succeed("","");
        }
        return ReturnData.succeed(new String(repositoryService.getModelEditorSource(modelId),
                StandardCharsets.UTF_8),"查询成功");
    }
}
