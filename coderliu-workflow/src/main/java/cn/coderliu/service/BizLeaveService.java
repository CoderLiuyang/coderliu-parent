package cn.coderliu.service;

import cn.coderliu.model.BizLeave;
import cn.coderliu.page.BizLeavePage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

public interface BizLeaveService extends IService<BizLeave> {
    Page<BizLeave> getPage(BizLeavePage page);

    void submitProcess(BizLeave bizLeave);
}
