package cn.coderliu.service.impl;

import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.admin.vo.detail.RoleVo;
import cn.coderliu.mapper.SysUserMapper;
import cn.coderliu.model.*;
import cn.coderliu.service.*;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
        getUserDetailVo.setId(sysUser.getId());
        getUserDetailVo.setDeptId(sysUser.getDeptId());
        getUserDetailVo.setPhone(sysUser.getPhone());
        getUserDetailVo.setUserName(sysUser.getLoginName());
        getUserDetailVo.setPassWord(sysUser.getPassword());
        getUserDetailVo.setStatus(sysUser.getStatus());


        List<SysUserRole> sysUserRoles = sysUserRoleService.list(new LambdaQueryWrapper<SysUserRole>()
                .eq(SysUserRole::getUserId, sysUser.getId()));
        if (sysUserRoles.isEmpty()) {
            return getUserDetailVo;
        }
        List<SysRole> sysRoles = sysRoleService.list(new LambdaQueryWrapper<SysRole>()
                .in(SysRole::getId, sysUserRoles.stream()
                        .map(SysUserRole::getRoleId).collect(Collectors.toList())));
        getUserDetailVo.setRoles(sysRoles.stream()
                .map(a -> RoleVo.builder()
                        .id(a.getId())
                        .roleKey(a.getRoleKey())
                        .dataScope(a.getDataScope())
                        .build()
                ).collect(Collectors.toList()));

        //判断是否是管理员
        getUserDetailVo.setIsAdmin(sysRoles.stream()
                .anyMatch(a -> a.getRoleKey().equals("admin")));


        List<SysRoleMenu> sysRoleMenus = sysRoleMenuService.list(new LambdaQueryWrapper<SysRoleMenu>()
                .in(SysRoleMenu::getRoleId, sysRoles.stream()
                        .map(SysRole::getId).collect(Collectors.toList())));
        if (sysRoleMenus.isEmpty()) {
            return getUserDetailVo;
        }
        List<SysMenu> sysMenus = sysMenuService.list(new LambdaQueryWrapper<SysMenu>()
                .in(SysMenu::getId, sysRoleMenus.stream()
                        .map(SysRoleMenu::getMenuId).collect(Collectors.toList())));
        if (sysMenus.isEmpty()) {
            return getUserDetailVo;
        }
        getUserDetailVo.setPermissions(sysMenus.stream()
                .map(SysMenu::getPerms).collect(Collectors.toList()));
        return getUserDetailVo;
    }


    public static void main(String[] args) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        System.out.println(passwordEncoder.encode("123456"));
    }
}
