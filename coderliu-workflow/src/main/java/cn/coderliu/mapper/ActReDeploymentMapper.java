package cn.coderliu.mapper;

import cn.coderliu.vo.ActReDeploymentVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;


public interface ActReDeploymentMapper {


         List<ActReDeploymentVO> selectActReDeploymentByIds(@Param("ids") Set<String> ids);

}
