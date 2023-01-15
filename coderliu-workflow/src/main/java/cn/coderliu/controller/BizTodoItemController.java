package cn.coderliu.controller;


import cn.coderliu.common.ReturnData;
import cn.coderliu.model.BizTodoItem;
import cn.coderliu.service.BizTodoItemService;
import cn.coderliu.utils.SecurityUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/bizTodo")
public class BizTodoItemController {


    private final BizTodoItemService bizTodoItemService;


    @GetMapping("/page")
    public ReturnData page(Page page) {
        return ReturnData.succeed(bizTodoItemService.page(page, new LambdaQueryWrapper<BizTodoItem>()
                .eq(BizTodoItem::getTodoUserId, SecurityUtils.getUser().getUsername())
                .isNull(BizTodoItem::getHandleUserId)
                .orderByDesc(BizTodoItem::getHandleTime)));
    }
    @GetMapping("/historyPage")
    public ReturnData historyPage(Page page) {
        return ReturnData.succeed(bizTodoItemService.page(page, new LambdaQueryWrapper<BizTodoItem>()
                .eq(BizTodoItem::getHandleUserId, SecurityUtils.getUser().getId())
                .orderByDesc(BizTodoItem::getHandleTime)));
    }


    @GetMapping("/{id}")
    public ReturnData getById(@PathVariable String id) {
        return ReturnData.succeed(bizTodoItemService.getById(id));
    }




}
