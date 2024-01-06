package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.FileSceneParamDto;
import cn.coderliu.model.FileSceneParam;
import cn.coderliu.page.FileSceneParamPage;
import cn.coderliu.service.FileSceneParamService;
import cn.coderliu.vo.FileSceneParamVo;
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
@RequestMapping("/fileSceneParam")
public class FileSceneParamController {

    private final FileSceneParamService fileSceneParamService;

    /**
     * 主键获取对象
     */
    @GetMapping("/{id}")
    @PreAuthorize("@pms.hasPermission('fileSceneParam_getOne')")
    public ReturnData<FileSceneParamVo> getOne(@PathVariable String id) {
        FileSceneParam fileSceneParam = fileSceneParamService.getById(id);
        return ReturnData.succeed(Convert.convert(FileSceneParamVo.class, fileSceneParam));
    }


    /**
     * 分页查询
     */
    @GetMapping("/page")
    @PreAuthorize("@pms.hasPermission('fileSceneParam_page')")
    public ReturnData<Page<FileSceneParam>> searchByPage(FileSceneParamPage pageBean) {
        Page<FileSceneParam> page = fileSceneParamService
                .page(pageBean,
                        new LambdaQueryWrapper<FileSceneParam>()
                                .eq(!StringUtils.isEmpty(pageBean.getBusId()), FileSceneParam::getBusId, pageBean.getBusId())
                                .eq(!StringUtils.isEmpty(pageBean.getSceneName()), FileSceneParam::getSceneName, pageBean.getSceneName())
                                .eq(!StringUtils.isEmpty(pageBean.getSceneOps()), FileSceneParam::getSceneOps, pageBean.getSceneOps())
                                .orderByDesc(FileSceneParam::getCreateTime));
        page.convert(a -> Convert.convert(FileSceneParamVo.class, a));
        return ReturnData.succeed(page);
    }


    /**
     * 单表查询
     */
    @GetMapping("/list")
    @PreAuthorize("@pms.hasPermission('fileSceneParam_list')")
    public ReturnData<List<FileSceneParamVo>> searchByList(@RequestBody FileSceneParamDto fileSceneParamDto) {
        List<FileSceneParamVo> list = fileSceneParamService
                .list(new LambdaQueryWrapper<FileSceneParam>()
                        .eq(!StringUtils.isEmpty(fileSceneParamDto.getBusId()), FileSceneParam::getBusId, fileSceneParamDto.getBusId())
                        .eq(!StringUtils.isEmpty(fileSceneParamDto.getSceneName()), FileSceneParam::getSceneName, fileSceneParamDto.getSceneName())
                        .eq(!StringUtils.isEmpty(fileSceneParamDto.getSceneOps()), FileSceneParam::getSceneOps, fileSceneParamDto.getSceneOps())
                        .orderByDesc(FileSceneParam::getCreateTime))
                .stream()
                .map(a -> Convert.convert(FileSceneParamVo.class, a))
                .collect(Collectors.toList());
        return ReturnData.succeed(list);
    }


    /**
     * 新增
     */
    @PostMapping
    @PreAuthorize("@pms.hasPermission('fileSceneParam_add')")
    public ReturnData<Boolean> add(@RequestBody FileSceneParamDto fileSceneParamDto) {
        return ReturnData.succeed(fileSceneParamService.save(Convert.convert(FileSceneParam.class, fileSceneParamDto)));
    }


    /**
     * 修改
     */
    @PutMapping
    @PreAuthorize("@pms.hasPermission('fileSceneParam_update')")
    public ReturnData<Boolean> update(@RequestBody FileSceneParamDto fileSceneParamDto) {
        return ReturnData.succeed(fileSceneParamService.updateById(Convert.convert(FileSceneParam.class, fileSceneParamDto)));
    }

    /**
     * 删除
     */
    @DeleteMapping("/{id}")
    @PreAuthorize("@pms.hasPermission('fileSceneParam_delete')")
    public ReturnData<Void> delete(@PathVariable String id) {
        fileSceneParamService.removeById(id);
        return ReturnData.succeed();
    }


    /**
     * 导出excel
     *
     * @return
     */
    @GetMapping("/exportExcel")
    @PreAuthorize("@pms.hasPermission('fileSceneParam_exportExcel')")
    public ReturnData<Map<String, Object>> exportExcel(@RequestBody FileSceneParamDto fileSceneParamDto) {
        List<FileSceneParamVo> list = fileSceneParamService
                .list(new LambdaQueryWrapper<FileSceneParam>()
                        .eq(!StringUtils.isEmpty(fileSceneParamDto.getBusId()), FileSceneParam::getBusId, fileSceneParamDto.getBusId())
                        .eq(!StringUtils.isEmpty(fileSceneParamDto.getSceneName()), FileSceneParam::getSceneName, fileSceneParamDto.getSceneName())
                        .eq(!StringUtils.isEmpty(fileSceneParamDto.getSceneOps()), FileSceneParam::getSceneOps, fileSceneParamDto.getSceneOps())
                        .orderByDesc(FileSceneParam::getCreateTime))
                .stream()
                .map(a -> Convert.convert(FileSceneParamVo.class, a))
                .collect(Collectors.toList());
        Map<String, Object> map = new HashMap<>(18);
        String[] headers =
                {
                        "业务ID", "场景名字", "场景配置"
                };
        String[] names =
                {
                        "bus_id", "scene_name", "scene_ops"
                };
        map.put("headers", headers);
        map.put("names", names);
        map.put("list", list);
        return ReturnData.succeed(map);
    }

}
