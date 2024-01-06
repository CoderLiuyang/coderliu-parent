package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.FileDataDto;
import cn.coderliu.model.FileData;
import cn.coderliu.page.FileDataPage;
import cn.coderliu.service.FileDataService;
import cn.coderliu.vo.FileDataVo;
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
@RequestMapping("/fileData")
public class FileDataController {

    private final FileDataService fileDataService;

    /**
     * 主键获取对象
     */
    @GetMapping("/{id}")
    @PreAuthorize("@pms.hasPermission('fileData_getOne')")
    public ReturnData<FileDataVo> getOne(@PathVariable String id) {
        FileData fileData = fileDataService.getById(id);
        return ReturnData.succeed(Convert.convert(FileDataVo.class, fileData));
    }


    /**
     * 分页查询
     */
    @GetMapping("/page")
    @PreAuthorize("@pms.hasPermission('fileData_page')")
    public ReturnData<Page<FileData>> searchByPage(FileDataPage pageBean) {
        Page<FileData> page = fileDataService
                .page(pageBean,
                        new LambdaQueryWrapper<FileData>()
                                .eq(!StringUtils.isEmpty(pageBean.getBusId()), FileData::getBusId, pageBean.getBusId())
                                .eq(!StringUtils.isEmpty(pageBean.getSceId()), FileData::getSceId, pageBean.getSceId())
                                .eq(!StringUtils.isEmpty(pageBean.getFileId()), FileData::getFileId, pageBean.getFileId())
                                .eq(!StringUtils.isEmpty(pageBean.getRealName()), FileData::getRealName, pageBean.getRealName())
                                .eq(!StringUtils.isEmpty(pageBean.getExtendName()), FileData::getExtendName, pageBean.getExtendName())
                                .eq(!StringUtils.isEmpty(pageBean.getName()), FileData::getName, pageBean.getName())
                                .orderByDesc(FileData::getCreateTime));
        page.convert(a -> Convert.convert(FileDataVo.class, a));
        return ReturnData.succeed(page);
    }


    /**
     * 单表查询
     */
    @GetMapping("/list")
    @PreAuthorize("@pms.hasPermission('fileData_list')")
    public ReturnData<List<FileDataVo>> searchByList(@RequestBody FileDataDto fileDataDto) {
        List<FileDataVo> list = fileDataService
                .list(new LambdaQueryWrapper<FileData>()
                        .eq(!StringUtils.isEmpty(fileDataDto.getBusId()), FileData::getBusId, fileDataDto.getBusId())
                        .eq(!StringUtils.isEmpty(fileDataDto.getSceId()), FileData::getSceId, fileDataDto.getSceId())
                        .eq(!StringUtils.isEmpty(fileDataDto.getFileId()), FileData::getFileId, fileDataDto.getFileId())
                        .eq(!StringUtils.isEmpty(fileDataDto.getRealName()), FileData::getRealName, fileDataDto.getRealName())
                        .eq(!StringUtils.isEmpty(fileDataDto.getExtendName()), FileData::getExtendName, fileDataDto.getExtendName())
                        .eq(!StringUtils.isEmpty(fileDataDto.getName()), FileData::getName, fileDataDto.getName())
                        .orderByDesc(FileData::getCreateTime))
                .stream()
                .map(a -> Convert.convert(FileDataVo.class, a))
                .collect(Collectors.toList());
        return ReturnData.succeed(list);
    }


    /**
     * 新增
     */
    @PostMapping
    @PreAuthorize("@pms.hasPermission('fileData_add')")
    public ReturnData<Boolean> add(@RequestBody FileDataDto fileDataDto) {
        return ReturnData.succeed(fileDataService.save(Convert.convert(FileData.class, fileDataDto)));
    }


    /**
     * 修改
     */
    @PutMapping
    @PreAuthorize("@pms.hasPermission('fileData_update')")
    public ReturnData<Boolean> update(@RequestBody FileDataDto fileDataDto) {
        return ReturnData.succeed(fileDataService.updateById(Convert.convert(FileData.class, fileDataDto)));
    }

    /**
     * 删除
     */
    @DeleteMapping("/{id}")
    @PreAuthorize("@pms.hasPermission('fileData_delete')")
    public ReturnData<Void> delete(@PathVariable String id) {
        fileDataService.removeById(id);
        return ReturnData.succeed();
    }


    /**
     * 导出excel
     *
     * @return
     */
    @GetMapping("/exportExcel")
    @PreAuthorize("@pms.hasPermission('fileData_exportExcel')")
    public ReturnData<Map<String, Object>> exportExcel(@RequestBody FileDataDto fileDataDto) {
        List<FileDataVo> list = fileDataService
                .list(new LambdaQueryWrapper<FileData>()
                        .eq(!StringUtils.isEmpty(fileDataDto.getBusId()), FileData::getBusId, fileDataDto.getBusId())
                        .eq(!StringUtils.isEmpty(fileDataDto.getSceId()), FileData::getSceId, fileDataDto.getSceId())
                        .eq(!StringUtils.isEmpty(fileDataDto.getFileId()), FileData::getFileId, fileDataDto.getFileId())
                        .eq(!StringUtils.isEmpty(fileDataDto.getRealName()), FileData::getRealName, fileDataDto.getRealName())
                        .eq(!StringUtils.isEmpty(fileDataDto.getExtendName()), FileData::getExtendName, fileDataDto.getExtendName())
                        .eq(!StringUtils.isEmpty(fileDataDto.getName()), FileData::getName, fileDataDto.getName())
                        .orderByDesc(FileData::getCreateTime))
                .stream()
                .map(a -> Convert.convert(FileDataVo.class, a))
                .collect(Collectors.toList());
        Map<String, Object> map = new HashMap<>(18);
        String[] headers =
                {
                        "业务id", "场景id", "连接业务id", "文件原名", "扩展名", "存储的名"
                };
        String[] names =
                {
                        "bus_id", "sce_id", "file_id", "real_name", "extend_name", "name"
                };
        map.put("headers", headers);
        map.put("names", names);
        map.put("list", list);
        return ReturnData.succeed(map);
    }

}
