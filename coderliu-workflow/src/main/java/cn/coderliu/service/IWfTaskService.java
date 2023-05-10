package cn.coderliu.service;

import cn.coderliu.model.dto.WfTaskDto;
import org.flowable.bpmn.model.UserTask;
import org.flowable.engine.runtime.ProcessInstance;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * @author KonBAI
 * @createTime 2022/3/10 00:12
 */
public interface IWfTaskService {

    /**
     * 审批任务
     *
     * @param task 请求实体参数
     */
    void complete(WfTaskDto task);

    /**
     * 拒绝任务
     *
     * @param taskBo
     */
    void taskReject(WfTaskDto taskBo);


    /**
     * 退回任务
     *
     * @param bo 请求实体参数
     */
    void taskReturn(WfTaskDto bo);

    /**
     * 获取所有可回退的节点
     *
     * @param bo
     * @return
     */
    List<UserTask> findReturnTaskList(WfTaskDto bo);

    /**
     * 删除任务
     *
     * @param bo 请求实体参数
     */
    void deleteTask(WfTaskDto bo);

    /**
     * 认领/签收任务
     *
     * @param bo 请求实体参数
     */
    void claim(WfTaskDto bo);

    /**
     * 取消认领/签收任务
     *
     * @param bo 请求实体参数
     */
    void unClaim(WfTaskDto bo);

    /**
     * 委派任务
     *
     * @param bo 请求实体参数
     */
    void delegateTask(WfTaskDto bo);


    /**
     * 转办任务
     *
     * @param bo 请求实体参数
     */
    void transferTask(WfTaskDto bo);

    /**
     * 取消申请
     *
     * @param bo
     * @return
     */
    void stopProcess(WfTaskDto bo);

    /**
     * 撤回流程
     *
     * @param bo
     * @return
     */
    void revokeProcess(WfTaskDto bo);

    /**
     * 获取流程过程图
     *
     * @param processId
     * @return
     */
    InputStream diagram(String processId);

    /**
     * 获取流程变量
     *
     * @param taskId 任务ID
     * @return 流程变量
     */
    Map<String, Object> getProcessVariables(String taskId);

    /**
     * 启动第一个任务
     *
     * @param processInstance 流程实例
     * @param variables       流程参数
     */
    void startFirstTask(ProcessInstance processInstance, Map<String, Object> variables);
}
