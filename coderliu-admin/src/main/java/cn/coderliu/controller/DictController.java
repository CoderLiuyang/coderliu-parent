

package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.model.SysDict;
import cn.coderliu.model.SysDictItem;
import cn.coderliu.service.SysDictItemService;
import cn.coderliu.service.SysDictService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * 字典表 前端控制器
 * </p>
 *
 * @author lengleng
 * @since 2019-03-19
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/dict")
public class DictController {

    private final SysDictItemService sysDictItemService;

    private final SysDictService sysDictService;

    /**
     * 通过ID查询字典信息
     *
     * @param id ID
     * @return 字典信息
     */
    @GetMapping("/{id}")
    public ReturnData<SysDict> getById(@PathVariable Long id) {
        return ReturnData.succeed(sysDictService.getById(id));
    }

    /**
     * 分页查询字典信息
     *
     * @param page 分页对象
     * @return 分页对象
     */
    @GetMapping("/page")
    public ReturnData<IPage<SysDict>> getDictPage(Page page, SysDict sysDict) {
        return ReturnData.succeed(sysDictService.page(page, Wrappers.<SysDict>lambdaQuery()
                .like(StrUtil.isNotBlank(sysDict.getDictKey()), SysDict::getDictKey, sysDict.getDictKey())));
    }

    /**
     * 通过字典类型查找字典
     *
     * @param type 类型
     * @return 同类型字典
     */
    @GetMapping("/key/{key}")
    //@Cacheable(value = CacheConstants.DICT_DETAILS, key = "#key")
    public ReturnData<List<SysDictItem>> getDictByKey(@PathVariable String key) {
        return ReturnData.succeed(sysDictItemService.list(Wrappers.<SysDictItem>query().lambda().eq(SysDictItem::getDictKey, key)));
    }

    /**
     * 添加字典
     *
     * @param sysDict 字典信息
     * @return success、false
     */
    //@SysLog("添加字典")
    @PostMapping
    @PreAuthorize("@pms.hasPermission('sys_dict_add')")
    public ReturnData<Boolean> save(@Valid @RequestBody SysDict sysDict) {
        return ReturnData.succeed(sysDictService.save(sysDict));
    }

    /**
     * 删除字典，并且清除字典缓存
     *
     * @param id ID
     * @return R
     */
    //@SysLog("删除字典")
    @DeleteMapping("/{id}")
    @PreAuthorize("@pms.hasPermission('sys_dict_del')")
    public ReturnData removeById(@PathVariable Long id) {
        sysDictService.removeById(id);
        return ReturnData.succeed();
    }

    /**
     * 修改字典
     *
     * @param sysDict 字典信息
     * @return success/false
     */
    @PutMapping
    //@SysLog("修改字典")
    @PreAuthorize("@pms.hasPermission('sys_dict_edit')")
    public ReturnData updateById(@Valid @RequestBody SysDict sysDict) {
         sysDictService.updateById(sysDict);
        return ReturnData.succeed();
    }

    /**
     * 分页查询
     *
     * @param page        分页对象
     * @param sysDictItem 字典项
     * @return
     */
    @GetMapping("/item/page")
    public ReturnData<IPage<SysDictItem>> getSysDictItemPage(Page<SysDictItem> page, SysDictItem sysDictItem) {
        return ReturnData.succeed(sysDictItemService.page(page, Wrappers.query(sysDictItem)));
    }

    /**
     * 通过id查询字典项
     *
     * @param id id
     * @return R
     */
    @GetMapping("/item/{id}")
    public ReturnData<SysDictItem> getDictItemById(@PathVariable("id") Long id) {
        return ReturnData.succeed(sysDictItemService.getById(id));
    }

    /**
     * 新增字典项
     *
     * @param sysDictItem 字典项
     * @return R
     */
    //@SysLog("新增字典项")
    @PostMapping("/item")
    //@CacheEvict(value = CacheConstants.DICT_DETAILS, allEntries = true)
    public ReturnData<Boolean> save(@RequestBody SysDictItem sysDictItem) {
        return ReturnData.succeed(sysDictItemService.save(sysDictItem));
    }

    /**
     * 修改字典项
     *
     * @param sysDictItem 字典项
     * @return R
     */
    //@SysLog("修改字典项")
    @PutMapping("/item")
    public ReturnData updateById(@RequestBody SysDictItem sysDictItem) {
        sysDictItemService.updateById(sysDictItem);
        return ReturnData.succeed();
    }

    /**
     * 通过id删除字典项
     *
     * @param id id
     * @return R
     */
    //@SysLog("删除字典项")
    @DeleteMapping("/item/{id}")
    public ReturnData removeDictItemById(@PathVariable Long id) {
          sysDictItemService.removeById(id);
        return ReturnData.succeed();
    }

    //@SysLog("清除字典缓存")
    @DeleteMapping("/cache")
    @PreAuthorize("@pms.hasPermission('sys_dict_del')")
    public ReturnData clearDictCache() {
        // sysDictService.clearDictCache();
        return ReturnData.succeed();
    }

}
