package cn.coderliu.controller;

import cn.coderliu.dto.ClientDto;
import cn.coderliu.model.ReturnData;
import cn.coderliu.service.IClientService;
import cn.coderliu.vo.ClientVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 应用相关接口
 *
 * @author duchao
 */
@RestController
@RequestMapping("/clients")
public class ClientController {

    @Autowired
    private IClientService clientService;

    @PostMapping("/list")
    public ReturnData<IPage<ClientVo>> list(@RequestBody ClientDto clientDto) {
        IPage<ClientVo> page = clientService.listClient(clientDto, true);
        return ReturnData.succeed(page);
    }

    @PostMapping("/saveOrUpdate")
    public ReturnData saveOrUpdate(@RequestBody ClientDto clientDto) throws Exception {
        return clientService.saveClient(clientDto);
    }
}
