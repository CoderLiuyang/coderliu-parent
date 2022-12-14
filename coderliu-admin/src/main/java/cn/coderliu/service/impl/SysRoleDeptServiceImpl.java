package cn.coderliu.service.impl;

import cn.coderliu.mapper.SysRoleDeptMapper;
import cn.coderliu.mapper.SysRoleMapper;
import cn.coderliu.model.SysRole;
import cn.coderliu.model.SysRoleDept;
import cn.coderliu.service.SysRoleDeptService;
import cn.coderliu.service.SysRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class SysRoleDeptServiceImpl extends ServiceImpl<SysRoleDeptMapper, SysRoleDept> implements SysRoleDeptService {
}
