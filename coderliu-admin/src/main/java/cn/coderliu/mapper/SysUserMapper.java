package cn.coderliu.mapper;

import cn.coderliu.model.SysUser;
import cn.coderliu.page.UserPageBean;
import cn.coderliu.vo.UserVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;

public interface SysUserMapper extends BaseMapper<SysUser> {
    IPage<UserVO> getUserWithRolePage(UserPageBean page);
}
