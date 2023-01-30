package cn.coderliu.service.impl;

import cn.coderliu.service.GeneratorService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class GeneratorServiceImpl implements GeneratorService {


    @Override
    public void generatorCode(String tableNames) {

    }

    @Override
    public IPage<List<Map<String, Object>>> getPage(Page page, String tableName, String name) {
        return null;
    }
}
