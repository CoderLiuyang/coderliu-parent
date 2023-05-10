package cn.coderliu.service.impl;

import cn.coderliu.mapper.WfCopyMapper;
import cn.coderliu.model.LoginUser;
import cn.coderliu.model.WfCopy;
import cn.coderliu.model.dto.WfCopyDto;
import cn.coderliu.model.dto.WfTaskDto;
import cn.coderliu.model.page.WfCopyPage;
import cn.coderliu.model.vo.WfCopyVo;
import cn.coderliu.service.IWfCopyService;
import cn.coderliu.utils.SecurityUtils;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.flowable.engine.HistoryService;
import org.flowable.engine.history.HistoricProcessInstance;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 流程抄送Service业务层处理
 *
 * @author KonBAI
 * @date 2022-05-19
 */
@RequiredArgsConstructor
@Service
public class WfCopyServiceImpl extends ServiceImpl<WfCopyMapper, WfCopy> implements IWfCopyService {


    private final HistoryService historyService;

    /**
     * 查询流程抄送
     *
     * @param copyId 流程抄送主键
     * @return 流程抄送
     */
    @Override
    public WfCopyVo queryById(Long copyId) {
        return Convert.convert(WfCopyVo.class,baseMapper.selectById(copyId));
    }

    /**
     * 查询流程抄送列表
     *
     * @param bo 流程抄送
     * @return 流程抄送
     */
    @Override
    public Page<WfCopyVo> selectPageList(WfCopyPage page) {
        LambdaQueryWrapper<WfCopy> lqw = buildQueryWrapper(Convert.convert(WfCopyDto.class, page));
        lqw.orderByDesc(WfCopy::getCreateTime);
        final WfCopyPage cp = page(page, lqw);
        final List<WfCopyVo> records = cp.getRecords().stream().map(a -> Convert.convert(WfCopyVo.class, a)).collect(Collectors.toList());
        Page<WfCopyVo> p = new Page<>(page.getCurrent(), page.getSize());
        p.setRecords(records);
        p.setTotal(cp.getTotal());
        return p;
    }

    /**
     * 查询流程抄送列表
     *
     * @param bo 流程抄送
     * @return 流程抄送
     */
    @Override
    public List<WfCopyVo> selectList(WfCopyDto dto) {
        LambdaQueryWrapper<WfCopy> lqw = buildQueryWrapper(dto);
        return baseMapper.selectList(lqw).stream()
                .map(a -> Convert.convert(WfCopyVo.class, a))
                .collect(Collectors.toList());
    }

    private LambdaQueryWrapper<WfCopy> buildQueryWrapper(WfCopyDto dto) {
        LambdaQueryWrapper<WfCopy> lqw = Wrappers.lambdaQuery();
        lqw.eq(dto.getUserId() != null, WfCopy::getUserId, dto.getUserId());
        lqw.like(StrUtil.isNotBlank(dto.getProcessName()), WfCopy::getProcessName, dto.getProcessName());
        lqw.like(StrUtil.isNotBlank(dto.getOriginatorName()), WfCopy::getOriginatorName, dto.getOriginatorName());
        return lqw;
    }

    @Override
    @Transactional
    public Boolean makeCopy(WfTaskDto dto) {
        if (StrUtil.isBlank(dto.getCopyUserIds())) {
            // 若抄送用户为空，则不需要处理，返回成功
            return true;
        }
        HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery()
                .processInstanceId(dto.getProcInsId()).singleResult();
        String[] ids = dto.getCopyUserIds().split(",");
        List<WfCopy> copyList = new ArrayList<>(ids.length);
        final LoginUser user = SecurityUtils.getUser();
        String originatorId = user.getId();
        String originatorName = user.getName();
        String title = historicProcessInstance.getProcessDefinitionName() + "-" + dto.getTaskName();
        for (String id : ids) {
            WfCopy copy = new WfCopy();
            copy.setTitle(title);
            copy.setProcessId(historicProcessInstance.getProcessDefinitionId());
            copy.setProcessName(historicProcessInstance.getProcessDefinitionName());
            copy.setDeploymentId(historicProcessInstance.getDeploymentId());
            copy.setInstanceId(dto.getProcInsId());
            copy.setTaskId(dto.getTaskId());
            copy.setUserId(id);
            copy.setOriginatorId(originatorId);
            copy.setOriginatorName(originatorName);
            copyList.add(copy);
        }
        return saveBatch(copyList);
    }
}
