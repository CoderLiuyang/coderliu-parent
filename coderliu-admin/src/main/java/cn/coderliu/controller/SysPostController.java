package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.model.SysPost;
import cn.coderliu.service.SysPostService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
