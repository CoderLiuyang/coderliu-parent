package cn.coderliu.service.impl;

import cn.coderliu.dto.CompleteDto;
import cn.coderliu.mapper.BizLeaveMapper;
import cn.coderliu.model.BizLeave;
import cn.coderliu.model.BizTodoItem;
import cn.coderliu.page.BizLeavePage;
import cn.coderliu.service.BizLeaveService;
import cn.coderliu.service.BizTodoItemService;
import cn.coderliu.service.ProcessService;
import cn.coderliu.utils.SecurityUtils;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

@Service
@RequiredArgsConstructor
public class BizLeaveServiceImpl extends ServiceImpl<BizLeaveMapper, BizLeave> implements BizLeaveService {


    private final ProcessService processService;

    private final BizTodoItemService bizTodoItemService;


    @Override
    public Page<BizLeave> getPage(BizLeavePage page) {
        return this.baseMapper.selectPage(page, new LambdaQueryWrapper<BizLeave>()
                .like(StrUtil.isNotBlank(page.getTitle()), BizLeave::getTitle, "%" + page.getTitle() + "%")
                .like(StrUtil.isNotBlank(page.getReason()), BizLeave::getReason, "%" + page.getReason() + "%"));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void submitProcess(String bizLeaveId) {
        BizLeave bizLeave = baseMapper.selectById(bizLeaveId);
        ProcessInstance p = processService.submitApply(SecurityUtils.getUser().getId(),
                bizLeave.getId(), "leave", bizLeave.getTitle(),
                bizLeave.getReason(), new HashMap<>());
        bizLeave.setInstanceId(p.getProcessInstanceId());
        baseMapper.updateById(bizLeave);

    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void complete(CompleteDto completeDto) throws Exception {
        BizTodoItem bizTodoItem = bizTodoItemService.getById(completeDto.getId());
        processService.complete(bizTodoItem.getTaskId(), bizTodoItem.getInstanceId(),
                bizTodoItem.getItemName(), bizTodoItem.getItemContent(), null ,new HashMap<>() {{
                    put("flag", completeDto.getApproveStatus());
                }});
        bizTodoItem.setHandleUserId(SecurityUtils.getUser().getId());
        bizTodoItem.setHandleUserName(SecurityUtils.getUser().getName());
        bizTodoItem.setIsHandle("1");
        bizTodoItem.setHandleRemark(completeDto.getRemark());
        bizTodoItem.updateById();

    }
}
