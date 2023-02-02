package cn.coderliu.service.impl;

import cn.coderliu.dto.GenDto;
import cn.coderliu.mapper.GeneratorMapper;
import cn.coderliu.model.GenDatasourceConf;
import cn.coderliu.page.GenPage;
import cn.coderliu.service.GenDatasourceConfService;
import cn.coderliu.service.GeneratorService;
import cn.coderliu.utils.GenUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class GeneratorServiceImpl implements GeneratorService {

    private final GeneratorMapper generatorMapper;

    private final GenDatasourceConfService genDatasourceConfService;


    @Override
    public IPage<List<Map<String, Object>>> getPage(GenPage page) {
        return generatorMapper.queryList(page, page.getTableName(), page.getDsName());
    }


    @Override
    public void generatorCode(GenDto data) {
        GenUtils.gen(data.getTableName(), data.getServerName(),
                genDatasourceConfService.getOne(new LambdaQueryWrapper<GenDatasourceConf>()
                        .eq(GenDatasourceConf::getName, data.getDsName())));

    }

}
