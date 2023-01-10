package cn.coderliu.service.impl;

import cn.coderliu.page.ModelPage;
import cn.coderliu.service.ModelService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.springframework.stereotype.Service;

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
}
