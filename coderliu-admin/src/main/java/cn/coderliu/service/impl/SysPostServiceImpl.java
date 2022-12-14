package cn.coderliu.service.impl;

import cn.coderliu.mapper.SysPostMapper;
import cn.coderliu.model.SysPost;
import cn.coderliu.service.SysPostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class SysPostServiceImpl extends ServiceImpl<SysPostMapper, SysPost> implements SysPostService {
}
