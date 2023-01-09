package cn.coderliu.controller;


import cn.coderliu.common.ReturnData;
import cn.coderliu.model.SysMenu;
import cn.coderliu.service.SysMenuService;
import cn.coderliu.utils.SecurityUtils;
import cn.hutool.core.lang.tree.Tree;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
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


    /**
     * 返回树形菜单集合
     * @param lazy 是否是懒加载
     * @param parentId 父节点ID
     * @return 树形菜单
     */
    @GetMapping(value = "/tree")
    public ReturnData<List<Tree<String>>> getTree(boolean lazy, String parentId) {
        return ReturnData.succeed(sysMenuService.treeMenu(lazy, parentId));
    }
    /**
     * 返回角色的菜单集合
     * @param roleId 角色ID
     * @return 属性集合
     */
    @GetMapping("/tree/{roleId}")
    public ReturnData<List<String>> getRoleTree(@PathVariable String roleId) {
        return ReturnData.succeed(
                sysMenuService.findMenuByRoleId(roleId).stream()
                        .map(SysMenu::getId).collect(Collectors.toList()));
    }

    /**
     * 新增菜单
     * @param sysMenu 菜单信息
     * @return 含ID 菜单信息
     */
    @PostMapping
    @PreAuthorize("@pms.hasPermission('sys_menu_add')")
    public ReturnData<SysMenu> save(@Valid @RequestBody SysMenu sysMenu) {
        sysMenuService.save(sysMenu);
        return ReturnData.succeed(sysMenu);
    }

    /**
     * 通过ID查询菜单的详细信息
     * @param id 菜单ID
     * @return 菜单详细信息
     */
    @GetMapping("/{id}")
    public ReturnData<SysMenu> getById(@PathVariable String id) {
        return ReturnData.succeed(sysMenuService.getById(id));
    }

    /**
     * 更新菜单
     * @param sysMenu
     * @return
     */
    @PutMapping
    @PreAuthorize("@pms.hasPermission('sys_menu_edit')")
    public ReturnData<Boolean> update(@Valid @RequestBody SysMenu sysMenu) {
        return ReturnData.succeed(sysMenuService.updateById(sysMenu));
    }

    /**
     * 删除菜单
     * @param id 菜单ID
     * @return success/false
     */
    @DeleteMapping("/{id:\\d+}")
    @PreAuthorize("@pms.hasPermission('sys_menu_del')")
    public ReturnData<Boolean> removeById(@PathVariable String id) {
        return ReturnData.succeed(sysMenuService.removeMenuById(id));
    }

}
