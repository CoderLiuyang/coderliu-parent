package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.RoleMenusDto;
import cn.coderliu.model.SysRole;
import cn.coderliu.service.SysRoleMenuService;
import cn.coderliu.service.SysRoleService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;


/**
 * 角色
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/role")
public class SysRoleController {

    private final SysRoleService sysRoleService;

    private final SysRoleMenuService sysRoleMenuService;


    /**
     * 分页查询角色信息
     *
     * @param page 分页对象
     * @return 分页对象
     */
    @GetMapping("/page")
    public ReturnData<IPage<SysRole>> getRolePage(Page<SysRole> page) {
        return ReturnData.succeed(sysRoleService.page(page, Wrappers.emptyWrapper()));
    }

    /**
     * 获取角色列表
     */
    @GetMapping("/list")
    public ReturnData<List<SysRole>> listRoles() {
        return ReturnData.succeed(sysRoleService.list(Wrappers.emptyWrapper()));
    }


    /**
     * 更新角色菜单
     * @param roleVo 角色对象
     */
    @PutMapping("/menu")
    @PreAuthorize("@pms.hasPermission('sys_role_perm')")
    public ReturnData<Boolean> saveRoleMenus(@RequestBody RoleMenusDto roleMenusDto) {
      return ReturnData.succeed(sysRoleMenuService.saveRoleMenus(roleMenusDto.getRoleId(), roleMenusDto.getMenuIds()));
    }

    /**
     * 修改角色
     * @param sysRole 角色信息
     * @return success/false
     */
    @PutMapping
    @PreAuthorize("@pms.hasPermission('sys_role_edit')")
    public ReturnData<Boolean> update(@Valid @RequestBody SysRole sysRole) {
        return ReturnData.succeed(sysRoleService.updateById(sysRole));
    }
}
