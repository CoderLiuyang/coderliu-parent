package cn.coderliu.service;

import cn.coderliu.dto.GenDto;
import cn.coderliu.page.GenPage;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;
import java.util.Map;

public interface GeneratorService {



    /**
     * 分页查询表
     *
     * @param page      分页信息
     * @param tableName 表名
     * @param name      数据源ID
     * @return
     */
    IPage<List<Map<String, Object>>> getPage(GenPage page);



    /**
     * 生成代码
     *
     * @param tableNames 表名称
     * @return
     */
    void generatorCode(GenDto data);

}
