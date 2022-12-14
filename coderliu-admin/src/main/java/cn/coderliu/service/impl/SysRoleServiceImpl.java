package cn.coderliu.service.impl;

import cn.coderliu.mapper.SysRoleMapper;
import cn.coderliu.mapper.SysUserMapper;
import cn.coderliu.model.SysRole;
import cn.coderliu.model.SysUser;
import cn.coderliu.service.SysRoleService;
import cn.coderliu.service.SysUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {
}
