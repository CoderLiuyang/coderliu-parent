package cn.coderliu.controller;


import cn.coderliu.common.ReturnData;
import cn.coderliu.utils.SecurityUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {


    @GetMapping("/test")
    public ReturnData test() {
        return ReturnData.succeed(SecurityUtils.getUser());
    }
}
