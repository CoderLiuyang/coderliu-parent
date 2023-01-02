package cn.coderliu.controller;


import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.common.ReturnData;
import cn.coderliu.model.LoginUser;
import cn.coderliu.page.UserPageBean;
import cn.coderliu.service.SysUserService;
import cn.coderliu.utils.SecurityUtils;
import cn.coderliu.vo.UserInfoVo;
import cn.coderliu.vo.UserVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class SysUserController {

    private final SysUserService sysUserService;


    /**
     * 通过用户名查询用户信息
     *
     * @param userName
     * @return
     */
    @PostMapping("/getUserDetail")
    public ReturnData<GetUserDetailVo> getUserDetail(String userName) {
        return ReturnData.succeed(sysUserService.getUserDetail(userName));
    }

    /**
     * 查询登陆人
     */
    @GetMapping("/info")
    public ReturnData<UserInfoVo> info() {
        return ReturnData.succeed(sysUserService.getUserInfo());
    }

    /**
     * 分页查询用户
     *
     * @param page    参数集
     */
    @GetMapping("/page")
    public ReturnData<IPage<UserVO>> getUserPage(UserPageBean page) {
       return ReturnData.succeed(sysUserService.getUserWithRolePage(page));
    }
}
