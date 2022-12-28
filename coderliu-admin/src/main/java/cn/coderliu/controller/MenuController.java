package cn.coderliu.controller;


import cn.coderliu.common.ReturnData;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/menu")
public class MenuController {


    /**
     * 返回当前用户的树形菜单集合
     * @param parentId 父节点ID
     * @return 当前用户的树形菜单
     */
    @GetMapping
    public ReturnData getUserMenu(Long parentId) {
        return ReturnData.succeed();
    }


}
