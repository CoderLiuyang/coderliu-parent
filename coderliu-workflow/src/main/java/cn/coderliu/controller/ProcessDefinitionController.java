package cn.coderliu.controller;

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
    @GetMapping()
    public Page list(ProcessDefinitionPage processDefinition) {
        return processDefinitionService.listProcessDefinition(processDefinition);
    }
}
