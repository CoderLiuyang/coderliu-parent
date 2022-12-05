package cn.coderliu.controller;


import cn.coderliu.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class TestController {

    private final SysUserService sysUserService;


    @GetMapping("/test")
    public void test() {
        var byId = sysUserService.getById(1);

        System.out.println(byId);
    }
}
