package cn.coderliu.service.impl;

import cn.coderliu.mapper.SysDictMapper;
import cn.coderliu.model.SysDict;
import cn.coderliu.service.SysDictService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class SysDictServiceImpl extends ServiceImpl<SysDictMapper, SysDict> implements SysDictService {
}
