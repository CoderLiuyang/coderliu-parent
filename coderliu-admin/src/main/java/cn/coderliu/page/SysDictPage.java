package cn.coderliu.page;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

@Data
public class SysDictPage extends Page {

    private String dictKey;

    private String systemFlag;
}
