package cn.coderliu.service;

import cn.coderliu.model.SysMenu;
import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Set;

public interface SysMenuService extends IService<SysMenu> {
    Set<SysMenu> findMenuByRoleId(String roleId);


    /**
     * 查询菜单
     * @param menuSet
     * @param parentId
     * @return
     */
    List<Tree<String>> filterMenu(Set<SysMenu> menuSet, String parentId);

    List<Tree<String>> treeMenu(boolean lazy, String parentId);

    Boolean removeMenuById(String id);
}
