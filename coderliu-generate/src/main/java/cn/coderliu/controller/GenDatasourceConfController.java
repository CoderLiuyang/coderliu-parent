package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.model.GenDatasourceConf;
import cn.coderliu.service.GenDatasourceConfService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/dsconf")
@RequiredArgsConstructor
public class GenDatasourceConfController {


    private final GenDatasourceConfService genDatasourceConfService;


    /**
     * 分页
     *
     * @param page
     * @return
     */
    @GetMapping("/page")
    public ReturnData<IPage<GenDatasourceConf>> page(Page page) {
        return ReturnData.succeed(genDatasourceConfService.page(page));
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
