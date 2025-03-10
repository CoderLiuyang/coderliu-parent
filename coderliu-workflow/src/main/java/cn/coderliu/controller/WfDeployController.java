package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.model.page.ProcessKeyPage;
import cn.coderliu.model.page.ProcessQueryPage;
import cn.coderliu.model.vo.WfDeployVo;
import cn.coderliu.service.IWfDeployFormService;
import cn.coderliu.service.IWfDeployService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 流程部署
 *
 * @author KonBAI
 * @createTime 2022/3/24 20:57
 */
@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/deploy")
public class WfDeployController  {

    private final IWfDeployService deployService;

    private final IWfDeployFormService deployFormService;

    /**
     * 查询流程部署列表
     */
    @GetMapping("/list")
    public ReturnData<Page<WfDeployVo>> list(ProcessQueryPage processQuery) {
        return deployService.queryPageList(processQuery);
    }

    /**
     * 查询流程部署版本列表
     */
    @GetMapping("/publishList")
    public ReturnData<Page<WfDeployVo>> publishList(ProcessKeyPage page) {
        return deployService.queryPublishList(page);
    }
//
//    /**
//     * 激活或挂起流程
//     *
//     * @param state 状态（active:激活 suspended:挂起）
//     * @param definitionId 流程定义ID
//     */
//    @SaCheckPermission("workflow:deploy:state")
//    @PutMapping(value = "/changeState")
//    public R<Void> changeState(@RequestParam String state, @RequestParam String definitionId) {
//        deployService.updateState(definitionId, state);
//        return R.ok();
//    }
//
//    /**
//     * 读取xml文件
//     * @param definitionId 流程定义ID
//     * @return
//     */
//    @SaCheckPermission("workflow:deploy:query")
//    @GetMapping("/bpmnXml/{definitionId}")
//    public R<String> getBpmnXml(@PathVariable(value = "definitionId") String definitionId) {
//        return R.ok(null, deployService.queryBpmnXmlById(definitionId));
//    }
//
//    /**
//     * 删除流程模型
//     * @param deployIds 流程部署ids
//     */
//    @SaCheckPermission("workflow:deploy:remove")
//    @Log(title = "删除流程部署", businessType = BusinessType.DELETE)
//    @DeleteMapping("/{deployIds}")
//    public R<String> remove(@NotEmpty(message = "主键不能为空") @PathVariable String[] deployIds) {
//        deployService.deleteByIds(Arrays.asList(deployIds));
//        return R.ok();
//    }
//
//    /**
//     * 查询流程部署关联表单信息
//     *
//     * @param deployId 流程部署id
//     */
//    @GetMapping("/form/{deployId}")
//    public R<?> start(@PathVariable(value = "deployId") String deployId) {
//        WfFormVo formVo = deployFormService.selectDeployFormByDeployId(deployId);
//        if (Objects.isNull(formVo)) {
//            return R.fail("请先配置流程表单");
//        }
//        return R.ok(JsonUtils.parseObject(formVo.getContent(), Map.class));
//    }
}
