package cn.coderliu.service.impl;

import cn.coderliu.mapper.GeneratorMapper;
import cn.coderliu.page.GenPage;
import cn.coderliu.service.GeneratorService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class GeneratorServiceImpl implements GeneratorService {

    private final GeneratorMapper generatorMapper;


    @Override
    public void generatorCode(String tableNames) {

    }

    @Override
    public IPage<List<Map<String, Object>>> getPage(GenPage page) {
        return generatorMapper.queryList(page,page.getTableName(),page.getDsName());
    }
}
