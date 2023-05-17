package cn.coderliu.page;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

@Data
public class BizLeavePage extends Page {

    /**
     * 标题
     */
    private String title;

    private String reason;

}
