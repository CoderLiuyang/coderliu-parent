package cn.coderliu.mapper;

import cn.coderliu.model.SysPost;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface SysPostMapper extends BaseMapper<SysPost> {


    /**
     * 通过用户ID，查询岗位信息
     * @param userId 用户id
     * @return 岗位信息
     */
    List<SysPost> listPostsByUserId(String userId);
}
