package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.FileBusinessParamDto;
import cn.coderliu.model.FileBusinessParam;
import cn.coderliu.page.FileBusinessParamPage;
import cn.coderliu.service.FileBusinessParamService;
import cn.coderliu.vo.FileBusinessParamVo;
import cn.hutool.core.convert.Convert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author liu
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/fileBusinessParam")
public class FileBusinessParamController {

    private final FileBusinessParamService fileBusinessParamService;

    /**
     * 主键获取对象
     */
    @GetMapping("/{id}")
    @PreAuthorize("@pms.hasPermission('fileBusinessParam_getOne')")
    public ReturnData<FileBusinessParamVo> getOne(@PathVariable String id) {
        FileBusinessParam fileBusinessParam = fileBusinessParamService.getById(id);
        return ReturnData.succeed(Convert.convert(FileBusinessParamVo.class, fileBusinessParam));
    }


    /**
     * 分页查询
     */
    @GetMapping("/page")
    @PreAuthorize("@pms.hasPermission('fileBusinessParam_page')")
    public ReturnData<Page<FileBusinessParam>> searchByPage(FileBusinessParamPage pageBean) {
        Page<FileBusinessParam> page = fileBusinessParamService
                .page(pageBean,
                        new LambdaQueryWrapper<FileBusinessParam>()
                                .eq(!StringUtils.isEmpty(pageBean.getBusName()), FileBusinessParam::getBusName, pageBean.getBusName())
                                .orderByDesc(FileBusinessParam::getCreateTime));
        page.convert(a -> Convert.convert(FileBusinessParamVo.class, a));
        return ReturnData.succeed(page);
    }


    /**
     * 单表查询
     */
    @GetMapping("/list")
    @PreAuthorize("@pms.hasPermission('fileBusinessParam_list')")
    public ReturnData<List<FileBusinessParamVo>> searchByList(@RequestBody FileBusinessParamDto fileBusinessParamDto) {
        List<FileBusinessParamVo> list = fileBusinessParamService
                .list(new LambdaQueryWrapper<FileBusinessParam>()
                        .eq(!StringUtils.isEmpty(fileBusinessParamDto.getBusName()), FileBusinessParam::getBusName, fileBusinessParamDto.getBusName())
                        .orderByDesc(FileBusinessParam::getCreateTime))
                .stream()
                .map(a -> Convert.convert(FileBusinessParamVo.class, a))
                .collect(Collectors.toList());
        return ReturnData.succeed(list);
    }


    /**
     * 新增
     */
    @PostMapping
    @PreAuthorize("@pms.hasPermission('fileBusinessParam_add')")
    public ReturnData<Boolean> add(@RequestBody FileBusinessParamDto fileBusinessParamDto) {
        return ReturnData.succeed(fileBusinessParamService.save(Convert.convert(FileBusinessParam.class, fileBusinessParamDto)));
    }


    /**
     * 修改
     */
    @PutMapping
    @PreAuthorize("@pms.hasPermission('fileBusinessParam_update')")
    public ReturnData<Boolean> update(@RequestBody FileBusinessParamDto fileBusinessParamDto) {
        return ReturnData.succeed(fileBusinessParamService.updateById(Convert.convert(FileBusinessParam.class, fileBusinessParamDto)));
    }

    /**
     * 删除
     */
    @DeleteMapping("/{id}")
    @PreAuthorize("@pms.hasPermission('fileBusinessParam_delete')")
    public ReturnData<Void> delete(@PathVariable String id) {
        fileBusinessParamService.removeById(id);
        return ReturnData.succeed();
    }


    /**
     * 导出excel
     *
     * @return
     */
    @GetMapping("/exportExcel")
    @PreAuthorize("@pms.hasPermission('fileBusinessParam_exportExcel')")
    public ReturnData<Map<String, Object>> exportExcel(@RequestBody FileBusinessParamDto fileBusinessParamDto) {
        List<FileBusinessParamVo> list = fileBusinessParamService
                .list(new LambdaQueryWrapper<FileBusinessParam>()
                        .eq(!StringUtils.isEmpty(fileBusinessParamDto.getBusName()), FileBusinessParam::getBusName, fileBusinessParamDto.getBusName())
                        .orderByDesc(FileBusinessParam::getCreateTime))
                .stream()
                .map(a -> Convert.convert(FileBusinessParamVo.class, a))
                .collect(Collectors.toList());
        Map<String, Object> map = new HashMap<>(18);
        String[] headers =
                {
                        "场景名字"
                };
        String[] names =
                {
                        "bus_name"
                };
        map.put("headers", headers);
        map.put("names", names);
        map.put("list", list);
        return ReturnData.succeed(map);
    }

}
