package cn.coderliu.service.impl;

import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.admin.vo.detail.RoleVo;
import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.UserDTO;
import cn.coderliu.enums.MenuTypeEnum;
import cn.coderliu.mapper.SysRoleMapper;
import cn.coderliu.mapper.SysUserMapper;
import cn.coderliu.mapper.SysUserPostMapper;
import cn.coderliu.mapper.SysUserRoleMapper;
import cn.coderliu.model.*;
import cn.coderliu.page.UserPageBean;
import cn.coderliu.service.*;
import cn.coderliu.utils.SecurityUtils;
import cn.coderliu.vo.UserInfoVo;
import cn.coderliu.vo.UserVO;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    private final SysUserRoleService sysUserRoleService;

    private final SysRoleService sysRoleService;

    private final SysRoleMenuService sysRoleMenuService;

    private final SysMenuService sysMenuService;

    private final SysRoleMapper sysRoleMapper;

    private final SysUserRoleMapper sysUserRoleMapper;

    private final SysUserPostMapper sysUserPostMapper;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public GetUserDetailVo getUserDetail(String userName) {
        var getUserDetailVo = new GetUserDetailVo();
        var sysUser = getOne(new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getLoginName, userName));
        getUserDetailVo.setId(sysUser.getId());
        getUserDetailVo.setDeptId(sysUser.getDeptId());
        getUserDetailVo.setPhone(sysUser.getPhone());
        getUserDetailVo.setUserName(sysUser.getLoginName());
        getUserDetailVo.setPassWord(sysUser.getPassword());
        getUserDetailVo.setStatus(sysUser.getStatus());


        var sysUserRoles = sysUserRoleService.list(new LambdaQueryWrapper<SysUserRole>()
                .eq(SysUserRole::getUserId, sysUser.getId()));
        if (sysUserRoles.isEmpty()) {
            return getUserDetailVo;
        }
        var sysRoles = sysRoleService.list(new LambdaQueryWrapper<SysRole>()
                .in(SysRole::getId, sysUserRoles.stream()
                        .map(SysUserRole::getRoleId).collect(Collectors.toList())));
        getUserDetailVo.setRoles(sysRoles.stream()
                .map(a -> RoleVo.builder()
                        .id(a.getId())
                        .name(a.getRoleName())
                        .roleKey(a.getRoleKey())
                        .dataScope(a.getDataScope())
                        .build()
                ).collect(Collectors.toList()));

        //判断是否是管理员
        getUserDetailVo.setIsAdmin(sysRoles.stream()
                .anyMatch(a -> a.getRoleKey().equals("admin")));


        var sysRoleMenus = sysRoleMenuService.list(new LambdaQueryWrapper<SysRoleMenu>()
                .in(SysRoleMenu::getRoleId, sysRoles.stream()
                        .map(SysRole::getId).collect(Collectors.toList())));
        if (sysRoleMenus.isEmpty()) {
            return getUserDetailVo;
        }
        var sysMenus = sysMenuService.list(new LambdaQueryWrapper<SysMenu>()
                .in(SysMenu::getId, sysRoleMenus.stream()
                        .map(SysRoleMenu::getMenuId).collect(Collectors.toList())));
        if (sysMenus.isEmpty()) {
            return getUserDetailVo;
        }
        getUserDetailVo.setPermissions(sysMenus.stream()
                .map(SysMenu::getPerms)
                .filter(StrUtil::isNotBlank)
                .collect(Collectors.toList()));
        return getUserDetailVo;
    }

    @Override
    public UserInfoVo getUserInfo() {
        var loginUser = SecurityUtils.getUser();
        var sysUser = new SysUser();
        sysUser.setId(loginUser.getId());
        sysUser.setUserName(loginUser.getName());
        sysUser.setPhone(loginUser.getPhone());
        sysUser.setDeptId(loginUser.getDeptId());
        sysUser.setDeptId(loginUser.getDeptId());
        sysUser.setAvatar(loginUser.getAvatar());
        // 设置角色列表
        var roleList = sysRoleMapper.listRolesByUserId(sysUser.getId());
        var roleIds = roleList.stream().map(SysRole::getId).collect(Collectors.toList());
        return UserInfoVo.builder()
                .sysUser(sysUser)
                .roles(roleList.stream().map(SysRole::getId).toArray(String[]::new))
                .permissions(roleIds.stream().map(sysMenuService::findMenuByRoleId).flatMap(Collection::stream)
                        .filter(m -> MenuTypeEnum.BUTTON.getType().equals(m.getMenuType())).map(SysMenu::getPerms)
                        .filter(StrUtil::isNotBlank).toArray(String[]::new))
                .build();
    }

    @Override
    public IPage<UserVO> getUserWithRolePage(UserPageBean page) {
        return baseMapper.getUserWithRolePage(page);
    }

    @Override
    public Boolean saveUser(UserDTO userDto) {
        //新增用户
        var user = Convert.convert(SysUser.class, userDto);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        save(user);
        userDto.getRole().forEach(a -> {
            SysUserRole.builder()
                    .userId(user.getId())
                    .roleId(a)
                    .build()
                    .insert();
        });
        userDto.getPost().forEach(a -> {
            SysUserPost.builder()
                    .userId(user.getId())
                    .postId(a)
                    .build()
                    .insert();
        });
        return Boolean.TRUE;
    }

    @Override
    public ReturnData<Boolean> updateUser(UserDTO userDto) {
        var user = Convert.convert(SysUser.class, userDto);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        updateById(user);
        sysUserRoleMapper
                .delete(Wrappers.<SysUserRole>update().lambda().eq(SysUserRole::getUserId, userDto.getId()));
        userDto.getRole().forEach(a -> {
            SysUserRole.builder()
                    .userId(user.getId())
                    .roleId(a)
                    .build()
                    .insert();
        });

        sysUserPostMapper.delete(Wrappers.<SysUserPost>lambdaQuery()
                .eq(SysUserPost::getUserId, userDto.getId()));
        userDto.getPost().forEach(postId -> {
            SysUserPost userPost = new SysUserPost();
            userPost.setUserId(user.getId());
            userPost.setPostId(postId);
            userPost.insert();
        });
        return ReturnData.succeed();
    }


    public static void main(String[] args) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        System.out.println(passwordEncoder.encode("123456"));
    }
}
