package cn.coderliu.service.impl;

import cn.coderliu.common.ReturnData;
import cn.coderliu.mapper.WfFormMapper;
import cn.coderliu.model.WfForm;
import cn.coderliu.model.dto.WfFormDto;
import cn.coderliu.model.page.WfFormPage;
import cn.coderliu.model.vo.WfFormVo;
import cn.coderliu.service.IWfFormService;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 流程表单Service业务层处理
 *
 * @author KonBAI
 * @createTime 2022/3/7 22:07
 */
@RequiredArgsConstructor
@Service
public class WfFormServiceImpl extends ServiceImpl<WfFormMapper, WfForm> implements IWfFormService {


    /**
     * 查询流程表单
     *
     * @param formId 流程表单ID
     * @return 流程表单
     */
    @Override
    public WfFormVo queryById(Long formId) {
        return Convert.convert(WfFormVo.class, baseMapper.selectById(formId));
    }

    /**
     * 查询流程表单列表
     *
     * @param page 流程表单
     * @return 流程表单
     */
    @Override
    public ReturnData<Page<WfFormVo>> queryPageList(WfFormPage page) {
        LambdaQueryWrapper<WfForm> lqw = buildQueryWrapper(page);

        final WfFormPage wp = page(page, new LambdaQueryWrapper<WfForm>()
                .like(StrUtil.isNotBlank(page.getFormName()), WfForm::getFormName, page.getFormName()));
        final Page<WfFormVo> wfFormVoPage = new Page<>(page.getCurrent(), page.getSize());
        wfFormVoPage.setRecords(wp.getRecords().stream()
                .map(a -> Convert.convert(WfFormVo.class, a))
                .collect(Collectors.toList()));
        wfFormVoPage.setTotal(wp.getTotal());
        return ReturnData.succeed(wfFormVoPage);
    }

    /**
     * 查询流程表单列表
     *
     * @param dto 流程表单
     * @return 流程表单
     */
    @Override
    public List<WfFormVo> queryList(WfFormDto dto) {
        final List<WfForm> wfForms = baseMapper.selectList(new LambdaQueryWrapper<WfForm>()
                .eq(StrUtil.isNotBlank(dto.getFormName()), WfForm::getFormName, dto.getFormName()));
        return wfForms.stream().map(a->Convert.convert(WfFormVo.class,a)).collect(Collectors.toList());
    }

    /**
     * 新增流程表单
     *
     * @param bo 流程表单
     * @return 结果
     */
    @Override
    public int insertForm(WfFormDto dto) {
        return baseMapper.insert(Convert.convert(WfForm.class, dto));
    }

    /**
     * 修改流程表单
     *
     * @param bo 流程表单
     * @return 结果
     */
    @Override
    public int updateForm(WfFormDto dto) {
        return baseMapper.update(new WfForm(), new LambdaUpdateWrapper<WfForm>()
                .set(StrUtil.isNotBlank(dto.getFormName()), WfForm::getFormName, dto.getFormName())
                .set(StrUtil.isNotBlank(dto.getContent()), WfForm::getContent, dto.getContent())
                .set(StrUtil.isNotBlank(dto.getRemark()), WfForm::getRemark, dto.getRemark())
                .eq(WfForm::getId, dto.getId()));
    }

    /**
     * 批量删除流程表单
     *
     * @param ids 需要删除的流程表单ID
     * @return 结果
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids) {
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    private LambdaQueryWrapper<WfForm> buildQueryWrapper(WfFormPage page) {
        LambdaQueryWrapper<WfForm> lqw = Wrappers.lambdaQuery();
        lqw.like(StrUtil.isNotBlank(page.getFormName()), WfForm::getFormName, page.getFormName());
        return lqw;
    }
}
