package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.model.SysRole;
import cn.coderliu.service.SysRoleMenuService;
import cn.coderliu.service.SysRoleService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


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
     * @param page 分页对象
     * @return 分页对象
     */
    @GetMapping("/page")
    public ReturnData<IPage<SysRole>> getRolePage(Page page) {
        return ReturnData.succeed(sysRoleService.page(page, Wrappers.emptyWrapper()));
    }
}
