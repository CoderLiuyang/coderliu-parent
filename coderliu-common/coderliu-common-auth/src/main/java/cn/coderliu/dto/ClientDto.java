package cn.coderliu.dto;

import cn.coderliu.model.Client;
import lombok.Data;

/**
 * @ClassName: ClientDto
 * @Description:
 * @Author: liu
 * @Date: 2020/9/16 11:50 上午
 * @Version: V1.0
 **/
@Data
public class ClientDto extends Client {
    private int offset;
    private int limit;

    public int getLimit() {
        return this.limit == 0 ? 20 : this.limit;
    }
}
