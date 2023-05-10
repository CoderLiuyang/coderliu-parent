package cn.coderliu.common.listener;

import cn.coderliu.common.constant.ProcessConstants;
import cn.coderliu.common.enums.ProcessStatus;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import lombok.RequiredArgsConstructor;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.springframework.stereotype.Component;

/**
 * Flowable 全局监听器
 *
 * @author konbai
 * @since 2023/3/8 22:45
 */
@Component
@RequiredArgsConstructor
public class GlobalEventListener extends AbstractFlowableEngineEventListener {


    private final RuntimeService runtimeService;

    /**
     * 流程结束监听器
     */
    @Override
    protected void processCompleted(FlowableEngineEntityEvent event) {
        String processInstanceId = event.getProcessInstanceId();
        Object variable = runtimeService.getVariable(processInstanceId, ProcessConstants.PROCESS_STATUS_KEY);
        ProcessStatus status = ProcessStatus.getProcessStatus(Convert.toStr(variable));
        if (ObjectUtil.isNotNull(status) && ProcessStatus.RUNNING == status) {
            runtimeService.setVariable(processInstanceId, ProcessConstants.PROCESS_STATUS_KEY, ProcessStatus.COMPLETED.getStatus());
        }
        super.processCompleted(event);
    }
}
