package cn.coderliu.controller;


import cn.coderliu.admin.vo.GetUserDetailVo;
import cn.coderliu.admin.vo.GetUserVo;
import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.UserDTO;
import cn.coderliu.model.SysUser;
import cn.coderliu.page.UserPageBean;
import cn.coderliu.service.SysUserService;
import cn.coderliu.vo.UserInfoVo;
import cn.coderliu.vo.UserVO;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

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
     * @param page 参数集
     */
    @GetMapping("/page")
    public ReturnData<IPage<UserVO>> getUserPage(UserPageBean page) {
        return ReturnData.succeed(sysUserService.getUserWithRolePage(page));
    }


    /**
     * 判断用户是否存在
     *
     * @param userDTO 查询条件
     * @return
     */
    @GetMapping("/check/exsit")
    public ReturnData<Boolean> isExsit(String loginName) {
        List<SysUser> sysUserList = sysUserService
                .list(new LambdaQueryWrapper<SysUser>()
                        .eq(SysUser::getLoginName, loginName));
        if (CollUtil.isNotEmpty(sysUserList)) {
            return ReturnData.succeed(Boolean.TRUE, "用户已经存在");
        }
        return ReturnData.succeed(Boolean.FALSE);
    }

    /**
     * 添加用户
     *
     * @param userDto 用户信息
     * @return success/false
     */
    @PostMapping
    @PreAuthorize("@pms.hasPermission('sys_user_add')")
    public ReturnData<Boolean> user(@RequestBody UserDTO userDto) {
        return ReturnData.succeed(sysUserService.saveUser(userDto));
    }

    /**
     * 管理员更新用户信息
     *
     * @param userDto 用户信息
     * @return R
     */
    @PutMapping
    @PreAuthorize("@pms.hasPermission('sys_user_edit')")
    public ReturnData<Boolean> updateUser(@Valid @RequestBody UserDTO userDto) {
        return sysUserService.updateUser(userDto);
    }

    /**
     * 删除用户信息
     *
     * @param id ID
     * @return R
     */
    @DeleteMapping("/{id}")
    @PreAuthorize("@pms.hasPermission('sys_user_del')")
    public ReturnData<Boolean> userDel(@PathVariable String id) {
        return ReturnData.succeed(sysUserService.removeById(id));
    }

    /**
     * 删除用户信息
     *
     * @param id ID
     * @return R
     */
    @GetMapping("/{id}")
    public ReturnData<GetUserVo> get(@PathVariable String id) {
        return ReturnData.succeed(Convert.convert(GetUserVo.class, sysUserService.getById(id)));
    }


}
