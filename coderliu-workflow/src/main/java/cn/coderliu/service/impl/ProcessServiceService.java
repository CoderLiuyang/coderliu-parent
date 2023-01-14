package cn.coderliu.service.impl;

import cn.coderliu.model.BizTodoItem;
import cn.coderliu.service.ProcessService;
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


    @Override
    @Transactional(rollbackFor = Exception.class)
    public ProcessInstance submitApply(String applyUserId, String businessKey, String key, String itemName, String itemContent, Map<String, Object> variables) {


        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(key, businessKey, variables);

        List<Task> taskList = taskService.createTaskQuery()
                .processInstanceId(processInstance.getProcessInstanceId())
                .active()
                .list();

        taskList.forEach(a -> {
            bizTodoItemService.save(BizTodoItem.builder()
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

    }
}
