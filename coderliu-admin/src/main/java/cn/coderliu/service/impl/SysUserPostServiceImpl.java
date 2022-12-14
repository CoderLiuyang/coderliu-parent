package cn.coderliu.service.impl;

import cn.coderliu.mapper.SysUserPostMapper;
import cn.coderliu.model.SysUserPost;
import cn.coderliu.service.SysUserPostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class SysUserPostServiceImpl extends ServiceImpl<SysUserPostMapper, SysUserPost> implements SysUserPostService {
}
