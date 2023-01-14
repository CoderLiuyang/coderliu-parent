package cn.coderliu.model;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BizTodoItem extends Model<BizTodoItem> {


    /**
     * 主键 ID
     */
    private String id;

    /**
     * 事项标题
     */
    private String itemName;

    /**
     * 事项内容
     */
    private String itemContent;

    /**
     * 模块名称 (必须以 uri 一致)
     */
    private String module;

    private String modelName;

    /**
     * 任务 ID
     */
    private String taskId;

    /**
     * 流程实例 ID
     */
    private String instanceId;

    /**
     * 任务名称 (必须以表单页面名称一致)
     */
    private String taskName;

    /**
     * 节点名称
     */
    private String nodeName;

    /**
     * 是否查看 default 0 (0 否 1 是)
     */
    private String isView;

    /**
     * 是否处理 default 0 (0 否 1 是)
     */
    private String isHandle;

    /**
     * 待办人 ID
     */
    private String todoUserId;

    /**
     * 待办人名称
     */
    private String todoUserName;

    /**
     * 处理人 ID
     */
    private String handleUserId;

    /**
     * 处理人名称
     */
    private String handleUserName;

    /**
     * 通知时间
     */
    private Date todoTime;

    /**
     * 处理时间
     */
    private Date handleTime;

    private Date createTime;


}
