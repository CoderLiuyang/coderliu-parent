package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.GenDto;
import cn.coderliu.page.GenPage;
import cn.coderliu.service.GeneratorService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;


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
    public ReturnData page(GenPage page) {
        return ReturnData.succeed(generatorService.getPage(page));
    }

    /**
     * 分页
     *
     * @param page
     * @return
     */
    @PostMapping("/genCodeReq")
    public ReturnData genCodeReq(@RequestBody GenDto data) {
        generatorService.generatorCode(data);
        return ReturnData.succeed();
    }


}
