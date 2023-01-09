package cn.coderliu.service;

import cn.coderliu.model.SysRoleMenu;
import com.baomidou.mybatisplus.extension.service.IService;

public interface SysRoleMenuService extends IService<SysRoleMenu> {

    /**
     * 更新角色菜单
     * @param roleId 角色
     * @param menuIds 菜单ID拼成的字符串，每个id之间根据逗号分隔
     * @return
     */
    Boolean saveRoleMenus(String roleId, String menuIds);
}
