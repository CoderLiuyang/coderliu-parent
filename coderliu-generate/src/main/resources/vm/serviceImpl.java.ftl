package cn.coderliu.service.impl;

import cn.coderliu.mapper.${entity}Mapper;
import cn.coderliu.model.${entity};
import cn.coderliu.service.${entity}Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class ${entity}ServiceImpl extends ServiceImpl<${entity}Mapper, ${entity}> implements ${entity}Service {
}
