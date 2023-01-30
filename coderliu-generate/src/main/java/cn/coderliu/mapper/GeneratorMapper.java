package cn.coderliu.mapper;

import cn.coderliu.page.GenPage;
import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface GeneratorMapper {

    /**
     * 分页查询表格
     *
     * @param page
     * @param tableName
     * @return
     */
    @DS("#dsName")
    IPage<List<Map<String, Object>>> queryList(GenPage page, @Param("tableName") String tableName, String dsName);


    /**
     * 查询表信息
     *
     * @param tableName 表名称
     * @param dsName    数据源名称
     * @return
     */
    @DS("#dsName")
    Map<String, String> queryTable(@Param("tableName") String tableName, String dsName);

    /**
     * 查询表列信息
     *
     * @param tableName 表名称
     * @param dsName    数据源名称
     * @return
     */
    @DS("#dsName")
    List<Map<String, String>> queryColumns(@Param("tableName") String tableName, String dsName);
}
