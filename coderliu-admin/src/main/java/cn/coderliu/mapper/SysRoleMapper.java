package cn.coderliu.mapper;

import cn.coderliu.model.SysRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface SysRoleMapper extends BaseMapper<SysRole> {
    List<SysRole> listRolesByUserId(String userId);
}
