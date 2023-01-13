package cn.coderliu.service.impl;

import cn.coderliu.mapper.BizLeaveMapper;
import cn.coderliu.model.BizLeave;
import cn.coderliu.page.BizLeavePage;
import cn.coderliu.service.BizLeaveService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BizLeaveServiceImpl extends ServiceImpl<BizLeaveMapper, BizLeave> implements BizLeaveService {




    @Override
    public Page<BizLeave> getPage(BizLeavePage page) {
        return this.baseMapper.selectPage(page, new LambdaQueryWrapper<BizLeave>()
                .like(StrUtil.isNotBlank(page.getTitle()), BizLeave::getTitle, "%" + page.getTitle() + "%")
                .like(StrUtil.isNotBlank(page.getReason()), BizLeave::getReason, "%" + page.getReason() + "%"));
    }

    @Override
    public void submitProcess(BizLeave bizLeave) {

    }
}
