package cn.coderliu.controller;


import cn.coderliu.common.ReturnData;
import cn.coderliu.service.BizTodoItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/bizTodo")
public class BizTodoItemController {


    private final BizTodoItemService bizTodoItemService;


    @GetMapping("/page")
    public ReturnData page() {
        return ReturnData.succeed();
    }


    @GetMapping("/{id}")
    public ReturnData getById(@PathVariable String id) {
        return ReturnData.succeed(bizTodoItemService.getById(id));
    }
}
