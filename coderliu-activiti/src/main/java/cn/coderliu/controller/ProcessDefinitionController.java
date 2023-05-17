package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.page.ProcessDefinitionPage;
import cn.coderliu.service.ProcessDefinitionService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 流程定义
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/processDefinition")
public class ProcessDefinitionController {


    private final ProcessDefinitionService processDefinitionService;


    /**
     * 查询流程定义
     * @param processDefinition
     * @return
     */
    @GetMapping("/page")
    public ReturnData<Page> list(ProcessDefinitionPage processDefinition) {
        return ReturnData.succeed(processDefinitionService.listProcessDefinition(processDefinition));
    }
}
