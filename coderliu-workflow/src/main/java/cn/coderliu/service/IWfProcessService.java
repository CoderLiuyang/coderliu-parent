package cn.coderliu.service;

import cn.coderliu.common.ReturnData;
import cn.coderliu.common.core.FormConf;
import cn.coderliu.common.core.domain.ProcessQuery;
import cn.coderliu.model.page.ProcessQueryPage;
import cn.coderliu.model.vo.WfDefinitionVo;
import cn.coderliu.model.vo.WfDetailVo;
import cn.coderliu.model.vo.WfTaskVo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;
import java.util.Map;

/**
 * @author KonBAI
 * @createTime 2022/3/24 18:57
 */
public interface IWfProcessService {

    /**
     * 查询可发起流程列表
     *
     * @param pageQuery 分页参数
     * @return
     */
    ReturnData<Page<WfDefinitionVo>> selectPageStartProcessList(ProcessQueryPage processQuery);

    /**
     * 查询可发起流程列表
     */
    List<WfDefinitionVo> selectStartProcessList(ProcessQuery processQuery);

    /**
     * 查询我的流程列表
     *
     * @param pageQuery 分页参数
     */
    ReturnData<Page<WfTaskVo>> selectPageOwnProcessList(ProcessQueryPage processQuery);

    /**
     * 查询我的流程列表
     */
    List<WfTaskVo> selectOwnProcessList(ProcessQuery processQuery);

    /**
     * 查询代办任务列表
     *
     * @param pageQuery 分页参数
     */
    ReturnData<Page<WfTaskVo>> selectPageTodoProcessList(ProcessQueryPage processQuery);

    /**
     * 查询代办任务列表
     */
    List<WfTaskVo> selectTodoProcessList(ProcessQuery processQuery);

    /**
     * 查询待签任务列表
     *
     * @param pageQuery 分页参数
     */
    ReturnData<Page<WfTaskVo>> selectPageClaimProcessList(ProcessQueryPage processQuery);

    /**
     * 查询待签任务列表
     */
    List<WfTaskVo> selectClaimProcessList(ProcessQuery processQuery);

    /**
     * 查询已办任务列表
     *
     * @param pageQuery 分页参数
     */
    ReturnData<Page<WfTaskVo>> selectPageFinishedProcessList(ProcessQueryPage processQuery);

    /**
     * 查询已办任务列表
     */
    List<WfTaskVo> selectFinishedProcessList(ProcessQuery processQuery);

    /**
     * 查询流程部署关联表单信息
     *
     * @param definitionId 流程定义ID
     * @param deployId     部署ID
     */
    FormConf selectFormContent(String definitionId, String deployId, String procInsId);

    /**
     * 启动流程实例
     *
     * @param procDefId 流程定义ID
     * @param variables 扩展参数
     */
    void startProcessByDefId(String procDefId, Map<String, Object> variables);

    /**
     * 通过DefinitionKey启动流程
     *
     * @param procDefKey 流程定义Key
     * @param variables  扩展参数
     */
    void startProcessByDefKey(String procDefKey, Map<String, Object> variables);


    /**
     * 读取xml文件
     *
     * @param processDefId 流程定义ID
     */
    String queryBpmnXmlById(String processDefId);


    /**
     * 查询流程任务详情信息
     *
     * @param procInsId 流程实例ID
     * @param taskId    任务ID
     */
    WfDetailVo queryProcessDetail(String procInsId, String taskId);
}
