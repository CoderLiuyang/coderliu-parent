package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.hutool.core.convert.Convert;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import cn.coderliu.service.${service};
import cn.coderliu.model.${entity};
import cn.coderliu.page.${entity}Page;
import cn.coderliu.vo.${entity}Vo;
import cn.coderliu.dto.${entity}Dto;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.util.StringUtils;

/**
 * @author ${author}
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/${entityPath}")
public class ${entity}Controller {

    private final ${service} ${serviceName};

    /**
   * 主键获取对象
   */
    @GetMapping("/{id}")
    @PreAuthorize("@pms.hasPermission('${entityPath}_getOne')")
    public ReturnData<${entity}Vo> getOne(@PathVariable String id) {
        ${entity} ${entityPath} = ${serviceName}.getById(id);
        return ReturnData.succeed(Convert.convert(${entity}Vo.class,${entityPath}));
    }



    /**
    * 分页查询
    */
    @GetMapping("/page")
    @PreAuthorize("@pms.hasPermission('${entityPath}_page')")
    public ReturnData<Page<${entity}>> searchByPage(${entity}Page pageBean) {
        Page<${entity}> page = ${serviceName}
            .page(pageBean,
                new LambdaQueryWrapper<${entity}>()
            <#list fieldsList as field>
                .eq(!StringUtils.isEmpty(pageBean.get${field}()),${entity}::get${field},pageBean.get${field}())
             </#list>
            .orderByDesc(${entity}::getCreateTime));
        page.convert(a -> Convert.convert(${entity}Vo.class, a));
        return ReturnData.succeed(page);
    }



   /**
   * 单表查询
   */
    @GetMapping("/list")
    @PreAuthorize("@pms.hasPermission('${entityPath}_list')")
    public ReturnData<List<${entity}Vo>> searchByList(@RequestBody ${entity}Dto ${entityPath}Dto) {
        List<${entity}Vo> list = ${entityPath}Service
                .list(new LambdaQueryWrapper<${entity}>()
                <#list fieldsList as field>
                    .eq(!StringUtils.isEmpty(${entityPath}Dto.get${field}()),${entity}::get${field},${entityPath}Dto.get${field}())
                </#list>
                        .orderByDesc(${entity}::getCreateTime))
                .stream()
                .map(a -> Convert.convert(${entity}Vo.class, a))
                .collect(Collectors.toList());
        return ReturnData.succeed(list);
    }


    /**
    * 新增
    */
    @PostMapping
    @PreAuthorize("@pms.hasPermission('${entityPath}_add')")
    public ReturnData<Void> add(@RequestBody ${entity}Dto ${entityPath}Dto) {
        return ReturnData.succeed(${serviceName}.save(Convert.convert(${entity}.class,${entityPath}Dto)));
    }


    /**
    * 修改
    */
    @PutMapping
    @PreAuthorize("@pms.hasPermission('${entityPath}_update')")
    public ReturnData<Void> update(@RequestBody ${entity}Dto ${entityPath}Dto) {
        return ReturnData.succeed(${serviceName}.updateById(Convert.convert(${entity}.class,${entityPath}Dto)));
    }

    /**
    * 删除
    */
    @DeleteMapping("/{id}")
    @PreAuthorize("@pms.hasPermission('${entityPath}_delete')")
    public ReturnData<Void> delete(@PathVariable String id) {
        ${serviceName}.removeById(id);
        return ReturnData.succeed();
    }


    /**
    * 导出excel
    *
    * @return
    */
    @GetMapping("/exportExcel")
    @PreAuthorize("@pms.hasPermission('${entityPath}_exportExcel')")
    public ReturnData<Map<String, Object>> exportExcel(@RequestBody ${entity}Dto ${entityPath}Dto) {
        List<${entity}Vo> list = ${entityPath}Service
                .list(new LambdaQueryWrapper<${entity}>()
                        <#list fieldsList as field>
                        .eq(!StringUtils.isEmpty(${entityPath}Dto.get${field}()),${entity}::get${field},${entityPath}Dto.get${field}())
                        </#list>
                        .orderByDesc(${entity}::getCreateTime))
                .stream()
                .map(a -> Convert.convert(${entity}Vo.class, a))
                .collect(Collectors.toList());
        Map<String, Object> map = new HashMap<>(18);
        String[] headers =
                {
                    ${comment}
                };
        String[] names =
                {
                    ${fieldNames}
                };
        map.put("headers", headers);
        map.put("names", names);
        map.put("list", list);
        return ReturnData.succeed(map);
    }

}
