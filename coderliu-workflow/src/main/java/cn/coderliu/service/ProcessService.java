package cn.coderliu.service;


import org.activiti.engine.runtime.ProcessInstance;

import java.util.Map;

/**
 * 流程服务
 */
public interface ProcessService {


    /**
     * 提交申请
     *
     * @param applyUserId 申请人
     * @param businessKey 业务表 id
     * @param key         流程定义 key
     * @param variables   流程变量
     * @return
     */
    ProcessInstance submitApply(String applyUserId, String businessKey, String key, String itemName, String itemContent, Map<String, Object> variables);


    /**
     * 审批流程
     *
     * @throws Exception
     */
    void complete(String taskId, String instanceId, String itemName, String itemContent, String module, Map<String, Object> variables) throws Exception;


}
