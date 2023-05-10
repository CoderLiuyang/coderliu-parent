package cn.coderliu.service;


import cn.coderliu.common.ReturnData;
import cn.coderliu.model.WfCategory;
import cn.coderliu.model.page.WfCategoryPage;
import cn.coderliu.model.vo.WfCategoryVo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Collection;
import java.util.List;

/**
 * 流程分类Service接口
 *
 * @author KonBAI
 * @date 2022-01-15
 */
public interface IWfCategoryService extends IService<WfCategory> {
    /**
     * 查询单个
     * @return
     */
    WfCategoryVo queryById(String categoryId);

    /**
     * 查询列表
     */
    ReturnData<Page<WfCategoryVo>> queryPageList(WfCategoryPage category);

    /**
     * 查询列表
     */
    List<WfCategoryVo> queryList(WfCategory category);

    /**
     * 新增流程分类
     *
     * @param category 流程分类信息
     * @return 结果
     */
    int insertCategory(WfCategory category);

    /**
     * 编辑流程分类
     * @param category 流程分类信息
     * @return 结果
     */
    int updateCategory(WfCategory category);

    /**
     * 校验并删除数据
     * @param ids 主键集合
     * @param isValid 是否校验,true-删除前校验,false-不校验
     * @return 结果
     */
    int deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 校验分类编码是否唯一
     *
     * @param category 流程分类
     * @return 结果
     */
    boolean checkCategoryCodeUnique(WfCategory category);
}
