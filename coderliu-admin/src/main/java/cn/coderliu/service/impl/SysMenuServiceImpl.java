package cn.coderliu.service.impl;

import cn.coderliu.constants.CommonConstants;
import cn.coderliu.enums.MenuTypeEnum;
import cn.coderliu.mapper.SysMenuMapper;
import cn.coderliu.mapper.SysUserMapper;
import cn.coderliu.model.SysMenu;
import cn.coderliu.model.SysUser;
import cn.coderliu.service.SysMenuService;
import cn.coderliu.service.SysUserService;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.wildfly.common.annotation.NotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {


    @Override
    public Set<SysMenu> findMenuByRoleId(String roleId) {
        return baseMapper.listMenusByRoleId(roleId);
    }

    @Override
    public List<Tree<String>> filterMenu(Set<SysMenu> menuSet, String parentId) {
        List<TreeNode<String>> collect = menuSet.stream()
                .filter(menu -> MenuTypeEnum.LEFT_MENU.getType().equals(menu.getMenuType()))
                .filter(menu -> StrUtil.isNotBlank(menu.getUrl()))
                .map(getNodeFunction()).collect(Collectors.toList());
        String parent = parentId == null ? CommonConstants.MENU_TREE_ROOT_ID : parentId;
        return TreeUtil.build(collect, parent);
    }

    @Override
    public List<Tree<String>> treeMenu(boolean lazy, String parentId) {
        if (!lazy) {
            List<TreeNode<String>> collect = baseMapper
                    .selectList(Wrappers.<SysMenu>lambdaQuery().orderByAsc(SysMenu::getOrderNum)).stream()
                    .map(getNodeFunction()).collect(Collectors.toList());
            return TreeUtil.build(collect, CommonConstants.MENU_TREE_ROOT_ID);
        }
        String parent = parentId == null ? CommonConstants.MENU_TREE_ROOT_ID : parentId;
        List<TreeNode<String>> collect = baseMapper
                .selectList(Wrappers.<SysMenu>lambdaQuery().eq(SysMenu::getPId, parent)
                        .orderByAsc(SysMenu::getOrderNum))
                .stream().map(getNodeFunction()).collect(Collectors.toList());
        return TreeUtil.build(collect, parent);
    }

    @Override
    public Boolean removeMenuById(String id) {
        remove(new LambdaQueryWrapper<SysMenu>().eq(SysMenu::getPId, id));
        removeById(id);
        return Boolean.TRUE;
    }

    @NotNull
    private Function<SysMenu, TreeNode<String>> getNodeFunction() {
        return menu -> {
            TreeNode<String> node = new TreeNode<>();
            node.setId(menu.getId());
            node.setName(menu.getMenuName());
            node.setParentId(menu.getPId());
            node.setWeight(menu.getOrderNum());
            // 扩展属性
            Map<String, Object> extra = new HashMap<>();
            extra.put("icon", menu.getIcon());
            extra.put("path", menu.getUrl());
            extra.put("type", menu.getMenuType());
            extra.put("perms", menu.getPerms());
            extra.put("label", menu.getMenuName());
            extra.put("sortOrder", menu.getOrderNum());
            extra.put("keepAlive", menu.getKeepAlive());
            node.setExtra(extra);
            return node;
        };
    }
}
