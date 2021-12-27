package cn.coderliu.controller;

import cn.coderliu.service.ITokensService;
import cn.coderliu.vo.TokenVo;
import cn.hutool.db.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * token管理接口
 *
 * @author zlt
 */
@RestController
@RequestMapping("/tokens")
public class TokensController {
    @Autowired
    private ITokensService tokensService;

    @GetMapping("")
    public PageResult<TokenVo> list(@RequestParam Map<String, Object> params, String tenantId) {
        return tokensService.listTokens(params, tenantId);
    }
}
