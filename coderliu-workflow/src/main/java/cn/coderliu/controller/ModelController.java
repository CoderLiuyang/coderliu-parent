package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.ModelDto;
import cn.coderliu.page.ModelPage;
import cn.coderliu.service.ModelService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 模型定义
 */
@RestController
@RequiredArgsConstructor
@Slf4j
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
     * 通过id获取模型json
     */
    @GetMapping("/{id}/json")
    public ReturnData getJson(@PathVariable String id) {
        return modelService.getJson(id);
    }

    /**
     * 保存模型
     */
    @PostMapping
    public ReturnData save(@RequestBody ModelDto modelDto) {
        try {
            return modelService.save(modelDto);
        } catch (Exception e) {
            log.error("保存模型报错！", e);
        }
        return null;
    }

    /**
     * 删除模型
     */
    @DeleteMapping("/{id}")
    public ReturnData delete(@PathVariable String id) {
        return modelService.delete(id);
    }


}
