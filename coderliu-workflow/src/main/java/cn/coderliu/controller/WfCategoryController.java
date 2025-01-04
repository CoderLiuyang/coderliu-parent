package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.model.WfCategory;
import cn.coderliu.model.page.WfCategoryPage;
import cn.coderliu.model.vo.WfCategoryVo;
import cn.coderliu.service.IWfCategoryService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 流程分类Controller
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/category")
public class WfCategoryController {

    private final IWfCategoryService categoryService;

    /**
     * 查询流程分类列表
     */
    @GetMapping("/list")
    public ReturnData<Page<WfCategoryVo>> list(WfCategoryPage category) {
        return categoryService.queryPageList(category);
    }

    /**
     * 查询全部的流程分类列表
     */
    @GetMapping("/listAll")
    public ReturnData<List<WfCategoryVo>> listAll(WfCategory category) {
        return ReturnData.succeed(categoryService.queryList(category));
    }


    /**
     * 获取流程分类详细信息
     *
     * @param categoryId 分类主键
     */
    @GetMapping("/{categoryId}")
    public ReturnData<WfCategoryVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable("categoryId") String categoryId) {
        return ReturnData.succeed(categoryService.queryById(categoryId));
    }

    /**
     * 新增流程分类
     */
    @PostMapping()
    public ReturnData<Void> add(@Validated @RequestBody WfCategory category) {
        if (!categoryService.checkCategoryCodeUnique(category)) {
            return ReturnData.failed("新增流程分类'" + category.getCategoryName() + "'失败，流程编码已存在");
        }
        categoryService.insertCategory(category);
        return ReturnData.succeed();
    }

    /**
     * 修改流程分类
     */
    @PutMapping()
    public ReturnData<Void> edit(@Validated @RequestBody WfCategory category) {
        if (!categoryService.checkCategoryCodeUnique(category)) {
            return ReturnData.failed("修改流程分类'" + category.getCategoryName() + "'失败，流程编码已存在");
        }
        categoryService.updateCategory(category);
        return ReturnData.succeed();
    }

    /**
     * 删除流程分类
     *
     * @param categoryIds 分类主键串
     */
    @DeleteMapping("/{categoryIds}")
    public ReturnData<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] categoryIds) {
        categoryService.deleteWithValidByIds(Arrays.asList(categoryIds), true);
        return ReturnData.succeed();
    }
}
