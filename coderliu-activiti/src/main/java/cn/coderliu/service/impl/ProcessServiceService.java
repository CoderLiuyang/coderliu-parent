package cn.coderliu.service.impl;

import cn.coderliu.admin.feign.AdminFeignService;
import cn.coderliu.admin.vo.GetUserVo;
import cn.coderliu.common.R;
import cn.coderliu.model.BizTodoItem;
import cn.coderliu.service.ProcessService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;
import org.activiti.engine.RuntimeService;
import cn.coderliu.service.BizTodoItemService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


@Service
@RequiredArgsConstructor
public class ProcessServiceService implements ProcessService {

    private final RuntimeService runtimeService;
    private final TaskService taskService;

    private final BizTodoItemService bizTodoItemService;

    private final AdminFeignService adminFeignService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ProcessInstance submitApply(String applyUserId, String businessKey, String key, String itemName, String itemContent, Map<String, Object> variables) {


        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(key, businessKey, variables);

        List<Task> taskList = taskService.createTaskQuery()
                .processInstanceId(processInstance.getProcessInstanceId())
                .active()
                .list();
        R<GetUserVo> getUserVo = adminFeignService.get(applyUserId);
        taskList.forEach(a -> {
            bizTodoItemService.save(BizTodoItem.builder()
                    .applyUserId(applyUserId)
                    .applyUserName(getUserVo.getCode() == 0 ? getUserVo.getData().getUserName() : "")
                    .itemName(itemName)
                    .itemContent(itemContent)
                    .nodeName(a.getName())
                    .instanceId(processInstance.getProcessInstanceId())
                    .taskName("task" + a.getTaskDefinitionKey().substring(0, 1).toUpperCase() + a.getTaskDefinitionKey().substring(1))
                    .todoUserName(a.getAssignee())
                    .todoUserId(a.getAssignee())
                    .taskId(a.getId())
                    .build());
        });
        return processInstance;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void complete(String taskId, String instanceId, String itemName, String itemContent, String module, Map<String, Object> variables) throws Exception {
        //走流程
        taskService.complete(taskId, variables);
        //插入todo表
        List<Task> taskList = taskService.createTaskQuery()
                .processInstanceId(instanceId)
                .active()
                .list();
        //查询提交人
        BizTodoItem bizTodoItem = bizTodoItemService.getOne(new LambdaQueryWrapper<BizTodoItem>()
                .eq(BizTodoItem::getInstanceId, instanceId)
                .orderByAsc(BizTodoItem::getId)
                .last("limit 1"));
        taskList.forEach(a -> {
            bizTodoItemService.save(BizTodoItem.builder()
                    .applyUserName(bizTodoItem.getApplyUserName())
                    .applyUserId(bizTodoItem.getApplyUserId())
                    .itemName(itemName)
                    .itemContent(itemContent)
                    .nodeName(a.getName())
                    .instanceId(instanceId)
                    .taskName("task" + a.getTaskDefinitionKey().substring(0, 1).toUpperCase() + a.getTaskDefinitionKey().substring(1))
                    .todoUserName(a.getAssignee())
                    .todoUserId(a.getAssignee())
                    .taskId(a.getId())
                    .build());
        });
    }
}
