package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.model.SysPost;
import cn.coderliu.service.SysPostService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 岗位
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/post")
public class SysPostController {

    private final SysPostService sysPostService;

    /**
     * 岗位分页
     */
    @GetMapping("/page")
    public ReturnData<IPage<SysPost>> list(Page<SysPost> page) {
        return ReturnData.succeed(sysPostService.page(page,
                new LambdaQueryWrapper<SysPost>().orderByAsc(SysPost::getPostSort)));
    }


    /**
     * 获取岗位列表
     *
     * @return 岗位列表
     */
    @GetMapping("/list")
    public ReturnData<List<SysPost>> listPosts() {
        return ReturnData.succeed(sysPostService.list(Wrappers.emptyWrapper()));
    }

    /**
     * 新增岗位信息表
     *
     * @param sysPost 岗位信息表
     * @return R
     */
    @PostMapping
    @PreAuthorize("@pms.hasPermission('sys_post_add')")
    public ReturnData<Boolean> save(@RequestBody SysPost sysPost) {
        return ReturnData.succeed(sysPostService.save(sysPost));
    }


    /**
     * 修改岗位信息表
     *
     * @param sysPost 岗位信息表
     * @return R
     */
    @PutMapping
    @PreAuthorize("@pms.hasPermission('sys_post_edit')")
    public ReturnData<Boolean> updateById(@RequestBody SysPost sysPost) {
        return ReturnData.succeed(sysPostService.updateById(sysPost));
    }

    /**
     * 通过id删除岗位信息表
     *
     * @param postId id
     * @return R
     */
    @DeleteMapping("/{postId}")
    @PreAuthorize("@pms.hasPermission('sys_post_del')")
    public ReturnData<Boolean> removeById(@PathVariable String postId) {
        return ReturnData.succeed(sysPostService.removeById(postId));
    }


}
