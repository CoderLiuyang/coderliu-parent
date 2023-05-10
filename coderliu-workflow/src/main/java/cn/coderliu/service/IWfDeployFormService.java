package cn.coderliu.service;

import cn.coderliu.model.WfDeployForm;
import cn.coderliu.model.vo.WfFormVo;
import com.baomidou.mybatisplus.extension.service.IService;
import org.flowable.bpmn.model.BpmnModel;

/**
 * 流程实例关联表单Service接口
 *
 * @author KonBAI
 * @createTime 2022/3/7 22:07
 */
public interface IWfDeployFormService extends IService<WfDeployForm> {

    /**
     * 新增流程实例关联表单
     *
     * @param wfDeployForm 流程实例关联表单
     * @return 结果
     */
    int insertWfDeployForm(WfDeployForm wfDeployForm);

    /**
     * 保存流程实例关联表单
     * @param deployId 部署ID
     * @param bpmnModel bpmnModel对象
     * @return
     */
    boolean saveInternalDeployForm(String deployId, BpmnModel bpmnModel);

    /**
     * 查询流程挂着的表单
     *
     * @param deployId
     * @return
     */
    @Deprecated
    WfFormVo selectDeployFormByDeployId(String deployId);
}
