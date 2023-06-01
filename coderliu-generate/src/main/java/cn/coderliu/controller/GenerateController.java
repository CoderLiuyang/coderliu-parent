package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.GenDto;
import cn.coderliu.page.GenPage;
import cn.coderliu.service.GeneratorService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


/**
 * 代码生成
 */
@RestController
@RequestMapping("/gen")
@RequiredArgsConstructor
public class GenerateController {


    private final GeneratorService generatorService;

    /**
     * 分页
     *
     * @param page
     * @return
     */
    @GetMapping("/page")
    public ReturnData<IPage<List<Map<String, Object>>>> page(GenPage page) {
        return ReturnData.succeed(generatorService.getPage(page));
    }

    /**
     * 分页
     *
     * @param page
     * @return
     */
    @PostMapping("/genCodeReq")
    public ReturnData<Void> genCodeReq(@RequestBody GenDto data) {
        generatorService.generatorCode(data);
        return ReturnData.succeed();
    }


}
