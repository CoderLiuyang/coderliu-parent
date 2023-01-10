package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.page.ModelPage;
import cn.coderliu.service.ModelService;
import lombok.RequiredArgsConstructor;
import org.activiti.engine.repository.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 模型定义
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/model")
public class ModelController {

    private final ModelService modelService;


    /**
     * 模型分页查询
     *
     * @return
     */
    @GetMapping("/page")
    public ReturnData page(ModelPage modelPage) {
        return ReturnData.succeed(modelService.page(modelPage));
    }

    /**
     * 模型分页查询
     *
     * @return
     */
    @PostMapping()
    public ReturnData save(Model modelPage) {
        return modelService.save(modelPage);
    }
}
