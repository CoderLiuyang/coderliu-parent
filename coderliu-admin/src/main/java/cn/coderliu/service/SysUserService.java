package cn.coderliu.service;

import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.dto.UserDTO;
import cn.coderliu.model.SysUser;
import cn.coderliu.page.UserPageBean;
import cn.coderliu.vo.UserInfoVo;
import cn.coderliu.vo.UserVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

public interface SysUserService extends IService<SysUser> {
    GetUserDetailVo getUserDetail(String userName);


    UserInfoVo getUserInfo();

    IPage<UserVO> getUserWithRolePage(UserPageBean page);

    Boolean saveUser(UserDTO userDto);
}
