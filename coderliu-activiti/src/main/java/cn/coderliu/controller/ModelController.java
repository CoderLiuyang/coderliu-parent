package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.ModelDto;
import cn.coderliu.page.ModelPage;
import cn.coderliu.service.ModelService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.activiti.engine.repository.Model;
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
    public ReturnData<Page<Model>> page(ModelPage modelPage) {
        return ReturnData.succeed(modelService.page(modelPage));
    }

    /**
     * 通过id获取模型json
     */
    @GetMapping("/{id}/json")
    public ReturnData<String> getJson(@PathVariable String id) {
        return modelService.getJson(id);
    }

    /**
     * 保存模型
     */
    @PostMapping
    public ReturnData<Void> save(@RequestBody ModelDto modelDto) {
        try {
            return modelService.save(modelDto);
        } catch (Exception e) {
            log.error("保存模型报错！", e);
        }
        return null;
    }

    /**
     * 修改模型
     */
    @PutMapping("/{id}")
    public ReturnData<Void> update(@RequestBody ModelDto modelDto, @PathVariable String id) {
        try {
            return modelService.update(modelDto,id);
        } catch (Exception e) {
            log.error("保存模型报错！", e);
        }
        return null;
    }

    /**
     * 删除模型
     */
    @DeleteMapping("/{id}")
    public ReturnData<Void> delete(@PathVariable String id) {
        return modelService.delete(id);
    }


}
