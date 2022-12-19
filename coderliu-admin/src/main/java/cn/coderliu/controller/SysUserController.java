package cn.coderliu.controller;


import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.common.ReturnData;
import cn.coderliu.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/sysUser")
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



        return ReturnData.succeed();
    }

}
