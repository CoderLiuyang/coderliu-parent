package cn.coderliu.service.impl;

import cn.coderliu.dto.ClientDto;
import cn.coderliu.lock.DistributedLock;
import cn.coderliu.mapper.ClientMapper;
import cn.coderliu.model.Client;
import cn.coderliu.model.ReturnData;
import cn.coderliu.service.IClientService;
import cn.coderliu.vo.ClientVo;
import cn.hutool.core.convert.Convert;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * 应用service
 *
 * @author duchao
 */
@Slf4j
@Service
public class ClientServiceImpl extends SuperServiceImpl<ClientMapper, Client> implements IClientService {

    private final static String LOCK_KEY_CLIENTID = "clientId:";

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private DistributedLock lock;

    @Override
    public ReturnData saveClient(Client client) throws Exception {
        client.setClientSecret(passwordEncoder.encode(client.getClientSecretStr()));
        String clientId = client.getClientId();
        super.saveOrUpdateIdempotency(client, lock
                , LOCK_KEY_CLIENTID + clientId
                , new QueryWrapper<Client>().eq("client_id", clientId)
                , clientId + "已存在");
        return ReturnData.succeed("操作成功");
    }

    @Override
    public IPage<ClientVo> listClient(ClientDto clientDto, boolean isPage) {
        QueryWrapper<Client> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        IPage<Client> page = baseMapper.selectPage(new Page<>(clientDto.getOffset(), clientDto.getLimit()), queryWrapper);
        IPage<ClientVo> data = page.convert(client -> Convert.convert(ClientVo.class, client));
        return data;
    }
}
