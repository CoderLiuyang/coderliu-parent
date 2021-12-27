package cn.coderliu.service;

import cn.coderliu.dto.ClientDto;
import cn.coderliu.model.Client;
import cn.coderliu.model.ReturnData;
import cn.coderliu.vo.ClientVo;
import com.baomidou.mybatisplus.core.metadata.IPage;


public interface IClientService extends ISuperService<Client> {

    ReturnData saveClient(Client clientDto) throws Exception;

    /**
     * 查询应用列表
     * @param isPage 是否分页
     */
    IPage<ClientVo> listClient(ClientDto clientDto, boolean isPage);

}
