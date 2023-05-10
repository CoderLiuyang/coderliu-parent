package cn.coderliu.mapper;

import cn.coderliu.model.WfForm;
import cn.coderliu.model.vo.WfFormVo;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 流程表单Mapper接口
 *
 * @author KonBAI
 * @createTime 2022/3/7 22:07
 */
public interface WfFormMapper extends BaseMapper<WfForm> {

    List<WfFormVo> selectFormVoList(@Param(Constants.WRAPPER) Wrapper<WfForm> queryWrapper);
}
