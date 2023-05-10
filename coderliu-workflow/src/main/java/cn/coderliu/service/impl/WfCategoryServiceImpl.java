package cn.coderliu.service.impl;

import cn.coderliu.common.ReturnData;
import cn.coderliu.mapper.WfCategoryMapper;
import cn.coderliu.model.WfCategory;
import cn.coderliu.model.page.WfCategoryPage;
import cn.coderliu.model.vo.WfCategoryVo;
import cn.coderliu.service.IWfCategoryService;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 流程分类Service业务层处理
 *
 * @author KonBAI
 * @date 2022-01-15
 */
@RequiredArgsConstructor
@Service
public class WfCategoryServiceImpl extends ServiceImpl<WfCategoryMapper, WfCategory> implements IWfCategoryService {


    @Override
    public WfCategoryVo queryById(String categoryId) {
        return Convert.convert(WfCategoryVo.class, getById(categoryId));
    }

    @Override
    public ReturnData<Page<WfCategoryVo>> queryPageList(WfCategoryPage category) {
        WfCategoryPage result = baseMapper.selectPage(category, new LambdaQueryWrapper<WfCategory>()
                .like(StrUtil.isNotBlank(category.getCategoryName()), WfCategory::getCategoryName, category.getCategoryName())
                .eq(StrUtil.isNotBlank(category.getCode()), WfCategory::getCode, category.getCode())
        );
        return ReturnData.succeed(new Page<WfCategoryVo>(category.getCurrent(), category.getSize())
                .setRecords(result.getRecords().stream().map(a->Convert.convert(WfCategoryVo.class,a)).collect(Collectors.toList()))
                .setTotal(result.getTotal())
        );
    }

    @Override
    public List<WfCategoryVo> queryList(WfCategory category) {
        LambdaQueryWrapper<WfCategory> lqw = buildQueryWrapper(category);
        return baseMapper.selectList(lqw).stream().map(a -> {
                    return Convert.convert(WfCategoryVo.class, a);
                }
        ).collect(Collectors.toList());
    }

    private LambdaQueryWrapper<WfCategory> buildQueryWrapper(WfCategory category) {
        LambdaQueryWrapper<WfCategory> lqw = Wrappers.lambdaQuery();
        lqw.like(StrUtil.isNotBlank(category.getCategoryName()), WfCategory::getCategoryName, category.getCategoryName());
        lqw.eq(StrUtil.isNotBlank(category.getCode()), WfCategory::getCode, category.getCode());
        return lqw;
    }

    @Override
    public int insertCategory(WfCategory categoryBo) {
        WfCategory add = BeanUtil.toBean(categoryBo, WfCategory.class);
        return baseMapper.insert(add);
    }

    @Override
    public int updateCategory(WfCategory categoryBo) {
        WfCategory update = BeanUtil.toBean(categoryBo, WfCategory.class);
        return baseMapper.updateById(update);
    }

    @Override
    public int deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids);
    }

    /**
     * 校验分类编码是否唯一
     *
     * @param category 流程分类
     * @return 结果
     */
    @Override
    public boolean checkCategoryCodeUnique(WfCategory category) {
        boolean exist = baseMapper.exists(new LambdaQueryWrapper<WfCategory>()
                .eq(WfCategory::getCode, category.getCode())
                .ne(ObjectUtil.isNotNull(category.getId()), WfCategory::getId, category.getId()));
        return !exist;
    }
}
