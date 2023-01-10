package cn.coderliu.service.impl;

import cn.coderliu.page.ProcessDefinitionPage;
import cn.coderliu.service.ProcessDefinitionService;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 定义流程
 */
@Service
@RequiredArgsConstructor
public class ProcessDefinitionServiceImpl implements ProcessDefinitionService {

    private final RuntimeService runtimeService;

    private final RepositoryService repositoryService;


    @Override
    public Page listProcessDefinition(ProcessDefinitionPage processDefinitionPage) {
        
        ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();
        processDefinitionQuery.orderByProcessDefinitionId().orderByProcessDefinitionVersion().desc();
        if (StrUtil.isNotBlank(processDefinitionPage.getName())) {
            processDefinitionQuery.processDefinitionNameLike("%" + processDefinitionPage.getName() + "%");
        }
        if (StrUtil.isNotBlank(processDefinitionPage.getKey())) {
            processDefinitionQuery.processDefinitionKeyLike("%" + processDefinitionPage.getKey() + "%");
        }
        if (StrUtil.isNotBlank(processDefinitionPage.getCategory())) {
            processDefinitionQuery.processDefinitionCategoryLike("%" + processDefinitionPage.getCategory() + "%");
        }
        Page<cn.coderliu.model.ProcessDefinition> page = new Page<>();


        List<ProcessDefinition> processDefinitionList = processDefinitionQuery
                .listPage(Math.toIntExact((processDefinitionPage.getCurrent() - 1) * processDefinitionPage.getSize()),
                        Math.toIntExact(processDefinitionPage.getSize()));
        page.setTotal(processDefinitionQuery.count());
        page.setRecords(processDefinitionList.stream()
                .map(a -> Convert.convert(cn.coderliu.model.ProcessDefinition.class, a))
                .collect(Collectors.toList()));
        return page;
    }
}
