package cn.coderliu.service;


import cn.coderliu.vo.TokenVo;
import cn.hutool.db.PageResult;

import java.util.Map;

public interface ITokensService {
    /**
     * 查询token列表
     * @param params 请求参数
     * @param clientId 应用id
     */
    PageResult<TokenVo> listTokens(Map<String, Object> params, String clientId);
}
