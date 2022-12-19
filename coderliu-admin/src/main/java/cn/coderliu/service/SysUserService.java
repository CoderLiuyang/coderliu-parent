package cn.coderliu.service;

import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.model.SysUser;
import com.baomidou.mybatisplus.extension.service.IService;

public interface SysUserService extends IService<SysUser> {
    GetUserDetailVo getUserDetail(String userName);
}
