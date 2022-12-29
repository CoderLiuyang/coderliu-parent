package cn.coderliu.controller;


import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.common.ReturnData;
import cn.coderliu.model.LoginUser;
import cn.coderliu.service.SysUserService;
import cn.coderliu.utils.SecurityUtils;
import cn.coderliu.vo.UserInfoVo;
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
     * 通过用户名查询用户信息
     *
     * @param userName
     * @return
     */
    @GetMapping("/test")
    // @PreAuthorize("@pms.hasPermission('sys_role_perm')")
    public void test(String userName) {
        final LoginUser user = SecurityUtils.getUser();
        System.out.println(user);
        System.out.println("123123123");
    }

}
