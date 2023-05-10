package cn.coderliu.service.impl;

import cn.coderliu.common.utils.ModelUtils;
import cn.coderliu.mapper.WfDeployFormMapper;
import cn.coderliu.mapper.WfFormMapper;
import cn.coderliu.model.WfDeployForm;
import cn.coderliu.model.WfForm;
import cn.coderliu.model.vo.WfFormVo;
import cn.coderliu.service.IWfDeployFormService;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.FlowNode;
import org.flowable.bpmn.model.StartEvent;
import org.flowable.bpmn.model.UserTask;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * 流程实例关联表单Service业务层处理
 *
 * @author KonBAI
 * @createTime 2022/3/7 22:07
 */
@RequiredArgsConstructor
@Service
public class WfDeployFormServiceImpl extends ServiceImpl<WfDeployFormMapper,WfDeployForm> implements IWfDeployFormService {


    private final WfFormMapper formMapper;

    /**
     * 新增流程实例关联表单
     *
     * @param deployForm 流程实例关联表单
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertWfDeployForm(WfDeployForm deployForm) {
        // 删除部署流程和表单的关联关系
        baseMapper.delete(new LambdaQueryWrapper<WfDeployForm>().eq(WfDeployForm::getDeployId, deployForm.getDeployId()));
        // 新增部署流程和表单关系
        return baseMapper.insert(deployForm);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean saveInternalDeployForm(String deployId, BpmnModel bpmnModel) {
        List<WfDeployForm> deployFormList = new ArrayList<>();
        // 获取开始节点
        StartEvent startEvent = ModelUtils.getStartEvent(bpmnModel);
        if (ObjectUtil.isNull(startEvent)) {
            throw new RuntimeException("开始节点不存在，请检查流程设计是否有误！");
        }
        // 保存开始节点表单信息
        WfDeployForm startDeployForm = buildDeployForm(deployId, startEvent);
        if (ObjectUtil.isNotNull(startDeployForm)) {
            deployFormList.add(startDeployForm);
        }
        // 保存用户节点表单信息
        Collection<UserTask> userTasks = ModelUtils.getAllUserTaskEvent(bpmnModel);
        if (CollUtil.isNotEmpty(userTasks)) {
            for (UserTask userTask : userTasks) {
                WfDeployForm userTaskDeployForm = buildDeployForm(deployId, userTask);
                if (ObjectUtil.isNotNull(userTaskDeployForm)) {
                    deployFormList.add(userTaskDeployForm);
                }
            }
        }
        // 批量新增部署流程和表单关联信息
        return saveBatch(deployFormList);
    }

    /**
     * 查询流程挂着的表单
     *
     * @param deployId
     * @return
     */
    @Override
    public WfFormVo selectDeployFormByDeployId(String deployId) {
        QueryWrapper<WfForm> wrapper = Wrappers.query();
        wrapper.eq("t2.deploy_id", deployId);
        List<WfFormVo> list = formMapper.selectFormVoList(wrapper);
        if (ObjectUtil.isNotEmpty(list)) {
            if (list.size() != 1) {
                throw new RuntimeException("表单信息查询错误");
            } else {
                return list.get(0);
            }
        } else {
            return null;
        }
    }

    /**
     * 构建部署表单关联信息对象
     * @param deployId 部署ID
     * @param node 节点信息
     * @return 部署表单关联对象。若无表单信息（formKey），则返回null
     */
    private WfDeployForm buildDeployForm(String deployId, FlowNode node) {
        String formKey = ModelUtils.getFormKey(node);
        if (StrUtil.isEmpty(formKey)) {
            return null;
        }
        Long formId = Convert.toLong(StringUtils.substringAfter(formKey, "key_"));
        WfForm wfForm = formMapper.selectById(formId);
        if (ObjectUtil.isNull(wfForm)) {
            throw new RuntimeException("表单信息查询错误");
        }
        WfDeployForm deployForm = new WfDeployForm();
        deployForm.setDeployId(deployId);
        deployForm.setFormKey(formKey);
        deployForm.setNodeKey(node.getId());
        deployForm.setFormName(wfForm.getFormName());
        deployForm.setNodeName(node.getName());
        deployForm.setContent(wfForm.getContent());
        return deployForm;
    }
}
