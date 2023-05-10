//package cn.coderliu.service;
//
//
//import cn.coderliu.model.dto.WfModelDto;
//import cn.coderliu.model.vo.WfModelVo;
//import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
//
//import java.util.Collection;
//import java.util.List;
//
///**
// * @author KonBAI
// * @createTime 2022/6/21 9:11
// */
//public interface IWfModelService {
//
//    /**
//     * 查询流程模型列表
//     */
//    Page<WfModelVo> list(WfModelDto modelDto, PageQuery pageQuery);
//
//    /**
//     * 查询流程模型列表
//     */
//    List<WfModelVo> list(WfModelDto modelDto);
//
//    /**
//     * 查询流程模型列表
//     */
//    Page<WfModelVo> historyList(WfModelDto modelDto, PageQuery pageQuery);
//
//    /**
//     * 查询流程模型详情信息
//     */
//    WfModelVo getModel(String modelId);
//
//    /**
//     * 查询流程表单详细信息
//     */
//    String queryBpmnXmlById(String modelId);
//
//    /**
//     * 新增模型信息
//     */
//    void insertModel(WfModelDto modelDto);
//
//    /**
//     * 修改模型信息
//     */
//    void updateModel(WfModelDto modelDto);
//
//    /**
//     * 保存流程模型信息
//     */
//    void saveModel(WfModelDto modelDto);
//
//    /**
//     * 设为最新流程模型
//     */
//    void latestModel(String modelId);
//
//    /**
//     * 删除流程模型
//     */
//    void deleteByIds(Collection<String> ids);
//
//    /**
//     * 部署流程模型
//     */
//    Boolean deployModel(String modelId);
//}
