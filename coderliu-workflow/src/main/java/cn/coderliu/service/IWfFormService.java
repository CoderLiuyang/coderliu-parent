package cn.coderliu.service;


import cn.coderliu.common.ReturnData;
import cn.coderliu.model.WfForm;
import cn.coderliu.model.dto.WfFormDto;
import cn.coderliu.model.page.WfFormPage;
import cn.coderliu.model.vo.WfFormVo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Collection;
import java.util.List;

/**
 * 表单
 *
 * @author KonBAI
 * @createTime 2022/3/7 22:07
 */
public interface IWfFormService extends IService<WfForm> {
    /**
     * 查询流程表单
     *
     * @param formId 流程表单ID
     * @return 流程表单
     */
    WfFormVo queryById(Long formId);

    /**
     * 查询流程表单列表
     *
     * @param bo 流程表单
     * @return 流程表单集合
     */
    ReturnData<Page<WfFormVo>> queryPageList(WfFormPage page);

    /**
     * 查询流程表单列表
     *
     * @param bo 流程表单
     * @return 流程表单集合
     */
    List<WfFormVo> queryList(WfFormDto wfFormDto);

    /**
     * 新增流程表单
     *
     * @param bo 流程表单
     * @return 结果
     */
    int insertForm(WfFormDto bo);

    /**
     * 修改流程表单
     *
     * @param bo 流程表单
     * @return 结果
     */
    int updateForm(WfFormDto bo);

    /**
     * 批量删除流程表单
     *
     * @param formIds 需要删除的流程表单ID
     * @return 结果
     */
    Boolean deleteWithValidByIds(Collection<Long> formIds);
}
