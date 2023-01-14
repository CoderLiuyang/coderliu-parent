package cn.coderliu.controller;


import cn.coderliu.common.ReturnData;
import cn.coderliu.dto.CompleteDto;
import cn.coderliu.model.BizLeave;
import cn.coderliu.page.BizLeavePage;
import cn.coderliu.service.BizLeaveService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/bizLeave")
public class BizLeaveController {


    private final BizLeaveService bizLeaveService;


    @GetMapping("/page")
    public ReturnData getPage(BizLeavePage page) {
        return ReturnData.succeed(bizLeaveService.getPage(page));
    }

    /**
     * 新增请假
     *
     * @param bizLeave
     * @return
     */
    @PostMapping
    public ReturnData add(@RequestBody BizLeave bizLeave) {
        return ReturnData.succeed(bizLeaveService.save(bizLeave));
    }

    /**
     * 修改请假
     */
    @PutMapping
    public ReturnData update(@RequestBody BizLeave bizLeave) {
        return ReturnData.succeed(bizLeaveService.updateById(bizLeave));
    }


    /**
     * 新增请假
     *
     * @param bizLeave
     * @return
     */
    @DeleteMapping("/{id}")
    public ReturnData delete(@PathVariable String id) {
        return ReturnData.succeed(bizLeaveService.removeById(id));
    }


    /**
     * 提交流程
     *
     * @param bizLeave
     * @return
     */
    @PostMapping("/submitProcess")
    public ReturnData submitProcess(@RequestBody BizLeave bizLeave) {
        bizLeaveService.submitProcess(bizLeave.getId());
        return ReturnData.succeed();
    }

    @PostMapping("/complete")
    public ReturnData complete(@RequestBody CompleteDto completeDto) {

        bizLeaveService.complete(completeDto);

        return ReturnData.succeed();
    }
}
