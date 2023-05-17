package cn.coderliu.service;

import cn.coderliu.page.ProcessDefinitionPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * 流程定义
 */
public interface ProcessDefinitionService {


    /**
     * 查询流程
     * @param page
     * @return
     */
    Page listProcessDefinition(ProcessDefinitionPage page);
}
