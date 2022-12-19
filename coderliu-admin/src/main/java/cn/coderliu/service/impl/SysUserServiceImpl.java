package cn.coderliu.service.impl;

import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.mapper.SysUserMapper;
import cn.coderliu.model.*;
import cn.coderliu.service.*;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    private final SysUserRoleService sysUserRoleService;

    private final SysRoleService sysRoleService;

    private final SysRoleMenuService sysRoleMenuService;

    private final SysMenuService sysMenuService;

    @Override
    public GetUserDetailVo getUserDetail(String userName) {
        GetUserDetailVo getUserDetailVo = new GetUserDetailVo();
        SysUser sysUser = getOne(new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getLoginName, userName));
        List<SysUserRole> sysUserRoles = sysUserRoleService.list(new LambdaQueryWrapper<SysUserRole>()
                .eq(SysUserRole::getUserId, sysUser.getId()));
        List<SysRole> sysRoles = sysRoleService.list(new LambdaQueryWrapper<SysRole>()
                .in(SysRole::getId, sysUserRoles.stream()
                        .map(SysUserRole::getRoleId).collect(Collectors.toList())));
        List<SysRoleMenu> sysRoleMenus = sysRoleMenuService.list(new LambdaQueryWrapper<SysRoleMenu>()
                .in(SysRoleMenu::getRoleId, sysRoles.stream()
                        .map(SysRole::getId).collect(Collectors.toList())));

        List<SysMenu> sysMenus = sysMenuService.list(new LambdaQueryWrapper<SysMenu>()
                .in(SysMenu::getId, sysRoleMenus.stream()
                        .map(SysRoleMenu::getMenuId).collect(Collectors.toList())));

        getUserDetailVo.setUserName(sysUser.getLoginName());
        getUserDetailVo.setPassWord(sysUser.getPassword());
        getUserDetailVo.setRoles(sysRoles.stream()
                .map(SysRole::getRoleKey).collect(Collectors.toList()));
        getUserDetailVo.setPermissions(sysMenus.stream()
                .map(SysMenu::getPerms).collect(Collectors.toList()));
        return getUserDetailVo;
    }
}
