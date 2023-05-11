package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.model.WfDeployForm;
import cn.coderliu.model.dto.WfFormDto;
import cn.coderliu.model.page.WfFormPage;
import cn.coderliu.model.vo.WfFormVo;
import cn.coderliu.service.IWfDeployFormService;
import cn.coderliu.service.IWfFormService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Arrays;

/**
 * 流程表单Controller
 *
 * @author KonBAI
 * @createTime 2022/3/7 22:07
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/form")
public class WfFormController {

    private final IWfFormService formService;

    private final IWfDeployFormService deployFormService;

    /**
     * 查询流程表单列表
     */
    @GetMapping("/list")
    public ReturnData<Page<WfFormVo>> list(WfFormPage page) {
        return formService.queryPageList(page);
    }


    /**
     * 获取流程表单详细信息
     *
     * @param formId 主键
     */
    @GetMapping(value = "/{formId}")
    public ReturnData<WfFormVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable("formId") String formId) {
        return ReturnData.succeed(formService.queryById(formId));
    }

    /**
     * 新增流程表单
     */
    @PostMapping
    public ReturnData<Void> add(@RequestBody WfFormDto dto) {
        formService.insertForm(dto);
        return ReturnData.succeed();
    }

    /**
     * 修改流程表单
     */
    @PutMapping
    public ReturnData<Void> edit(@RequestBody WfFormDto dto) {
        formService.updateForm(dto);
        return ReturnData.succeed();
    }

    /**
     * 删除流程表单
     *
     * @param formIds 主键串
     */
    @DeleteMapping("/{formIds}")
    public ReturnData<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable String[] formIds) {
        formService.deleteWithValidByIds(Arrays.asList(formIds));
        return ReturnData.succeed();
    }


    /**
     * 挂载流程表单
     */
    @PostMapping("/addDeployForm")
    public ReturnData<Void> addDeployForm(@RequestBody WfDeployForm deployForm) {
        deployFormService.insertWfDeployForm(deployForm);
        return ReturnData.succeed();
    }
}
