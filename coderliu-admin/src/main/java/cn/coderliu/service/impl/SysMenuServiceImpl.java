package cn.coderliu.service.impl;

import cn.coderliu.mapper.SysMenuMapper;
import cn.coderliu.mapper.SysUserMapper;
import cn.coderliu.model.SysMenu;
import cn.coderliu.model.SysUser;
import cn.coderliu.service.SysMenuService;
import cn.coderliu.service.SysUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {
}
