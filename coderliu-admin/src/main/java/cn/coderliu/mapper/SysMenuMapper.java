package cn.coderliu.mapper;

import cn.coderliu.model.SysMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.Set;

public interface SysMenuMapper extends BaseMapper<SysMenu> {
    Set<SysMenu> listMenusByRoleId(String roleId);
}
