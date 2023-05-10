package cn.coderliu.service;

import cn.coderliu.model.WfCopy;
import cn.coderliu.model.dto.WfCopyDto;
import cn.coderliu.model.dto.WfTaskDto;
import cn.coderliu.model.page.WfCopyPage;
import cn.coderliu.model.vo.WfCopyVo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 流程抄送Service接口
 *
 * @author KonBAI
 * @date 2022-05-19
 */
public interface IWfCopyService extends IService<WfCopy> {

    /**
     * 查询流程抄送
     *
     * @param copyId 流程抄送主键
     * @return 流程抄送
     */
    WfCopyVo queryById(Long copyId);

    /**
     * 查询流程抄送列表
     *
     * @param wfCopy 流程抄送
     * @return 流程抄送集合
     */
    Page<WfCopyVo> selectPageList(WfCopyPage wfCopy);

    /**
     * 查询流程抄送列表
     *
     * @param wfCopy 流程抄送
     * @return 流程抄送集合
     */
    List<WfCopyVo> selectList(WfCopyDto wfCopy);

    /**
     * 抄送
     * @param taskBo
     * @return
     */
    Boolean makeCopy(WfTaskDto dto);
}
