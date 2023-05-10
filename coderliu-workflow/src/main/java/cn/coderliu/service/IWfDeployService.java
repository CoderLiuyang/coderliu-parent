package cn.coderliu.service;

import cn.coderliu.common.ReturnData;
import cn.coderliu.common.core.domain.ProcessQuery;
import cn.coderliu.model.page.ProcessKeyPage;
import cn.coderliu.model.page.ProcessQueryPage;
import cn.coderliu.model.vo.WfDeployVo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

/**
 * @author KonBAI
 * @createTime 2022/6/30 9:03
 */
public interface IWfDeployService {

    ReturnData<Page<WfDeployVo>> queryPageList(ProcessQueryPage processQuery);

    ReturnData<Page<WfDeployVo>> queryPublishList(ProcessKeyPage page);

    void updateState(String definitionId, String stateCode);

    String queryBpmnXmlById(String definitionId);

    void deleteByIds(List<String> deployIds);
}
