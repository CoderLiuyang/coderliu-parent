package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.model.GenDatasourceConf;
import cn.coderliu.service.GenDatasourceConfService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 数据源配置
 */
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
    public ReturnData<Boolean> add(@RequestBody GenDatasourceConf genDatasourceConf) {
        return ReturnData.succeed(genDatasourceConfService.saveGenDatasourceConf(genDatasourceConf));
    }

    /**
     * 修改
     */
    @PutMapping
    public ReturnData<Boolean> update(@RequestBody GenDatasourceConf genDatasourceConf) {
        return ReturnData.succeed(genDatasourceConfService.updateGenDatasourceConf(genDatasourceConf));
    }

    /**
     * 删除
     */
    @DeleteMapping("/{id}")
    public ReturnData<Boolean> delete(@PathVariable String id) {
        return ReturnData.succeed(genDatasourceConfService.deleteGenDatasourceConf(id));
    }
}
