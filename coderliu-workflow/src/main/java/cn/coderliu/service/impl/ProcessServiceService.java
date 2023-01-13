package cn.coderliu.service.impl;

import cn.coderliu.service.ProcessService;
import lombok.RequiredArgsConstructor;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Service;
import org.activiti.engine.RuntimeService;
import cn.coderliu.service.BizTodoItemService;
import java.util.Map;


@Service
@RequiredArgsConstructor
public class ProcessServiceService implements ProcessService {

    private final RuntimeService runtimeService;

    private final BizTodoItemService bizTodoItemService;


    @Override
    public ProcessInstance submitApply(String applyUserId, String businessKey, String key, Map<String, Object> variables) {


        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(key, businessKey);

        return processInstance;
    }

    @Override
    public void complete(String taskId, String instanceId, String itemName, String itemContent, String module, Map<String, Object> variables) throws Exception {

    }
}
