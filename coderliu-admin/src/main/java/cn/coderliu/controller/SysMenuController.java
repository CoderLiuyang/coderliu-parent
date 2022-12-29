package cn.coderliu.controller;


import cn.coderliu.common.ReturnData;
import cn.coderliu.model.SysMenu;
import cn.coderliu.service.SysMenuService;
import cn.coderliu.utils.SecurityUtils;
import cn.hutool.core.lang.tree.Tree;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
@RequestMapping("/menu")
public class SysMenuController {

    private final SysMenuService sysMenuService;

    /**
     * 返回当前用户的树形菜单集合
     *
     * @param parentId 父节点ID
     * @return 当前用户的树形菜单
     */
    @GetMapping
    public ReturnData getUserMenu(String parentId) {
        // 获取符合条件的菜单
        Set<SysMenu> menuSet = SecurityUtils.getRoles().stream().map(sysMenuService::findMenuByRoleId)
                .flatMap(Collection::stream).collect(Collectors.toSet());
        final List<Tree<String>> trees = sysMenuService.filterMenu(menuSet, parentId);
        return ReturnData.succeed(trees);
    }


}
