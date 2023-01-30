package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.model.GenDatasourceConf;
import cn.coderliu.page.GenPage;
import cn.coderliu.service.GenDatasourceConfService;
import cn.coderliu.service.GeneratorService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 代码生成
 */
@RestController
@RequestMapping("/gen")
@RequiredArgsConstructor
public class GenerateController {


    private final GenDatasourceConfService genDatasourceConfService;

    private final GeneratorService generatorService;

    /**
     * 分页
     *
     * @param page
     * @return
     */
    @GetMapping("/page")
    public ReturnData page(GenPage page) {
        return ReturnData.succeed(generatorService.getPage(page));
    }



    /**
     * 获取列表
     */
    @GetMapping("/list")
    public ReturnData<List<GenDatasourceConf>> list() {
        return ReturnData.succeed(genDatasourceConfService.list(new LambdaQueryWrapper<GenDatasourceConf>()
                .orderByDesc(GenDatasourceConf::getCreateTime)));
    }

    /**
     * 新增
     */
    @PostMapping
    public ReturnData add(@RequestBody GenDatasourceConf genDatasourceConf) {
        return ReturnData.succeed(genDatasourceConfService.saveGenDatasourceConf(genDatasourceConf));
    }

    /**
     * 修改
     */
    @PutMapping
    public ReturnData update(@RequestBody GenDatasourceConf genDatasourceConf) {
        return ReturnData.succeed(genDatasourceConfService.updateGenDatasourceConf(genDatasourceConf));
    }

    /**
     * 删除
     */
    @DeleteMapping("/{id}")
    public ReturnData delete(@PathVariable String id) {
        return ReturnData.succeed(genDatasourceConfService.deleteGenDatasourceConf(id));
    }
}
