package cn.coderliu.service.impl;

import cn.coderliu.mapper.GenDatasourceConfMapper;
import cn.coderliu.model.GenDatasourceConf;
import cn.coderliu.service.GenDatasourceConfService;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.spring.SpringUtil;
import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import com.baomidou.dynamic.datasource.creator.DataSourceCreator;
import com.baomidou.dynamic.datasource.spring.boot.autoconfigure.DataSourceProperty;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.DriverManager;
import java.sql.SQLException;

@Service
@Slf4j
@RequiredArgsConstructor
public class GenDatasourceConfServiceImpl extends ServiceImpl<GenDatasourceConfMapper, GenDatasourceConf> implements GenDatasourceConfService {

  //  private final StringEncryptor stringEncryptor;

    private final DataSourceCreator hikariDataSourceCreator;


    @Override
    public boolean saveGenDatasourceConf(GenDatasourceConf genDatasourceConf) {
        // 校验配置合法性
        if (!checkDataSource(genDatasourceConf)) {
            return Boolean.FALSE;
        }
        addDynamicDataSource(genDatasourceConf);
//        if (StrUtil.isNotBlank(genDatasourceConf.getPassword())) {
//            genDatasourceConf.setPassword(stringEncryptor.encrypt(genDatasourceConf.getPassword()));
//        }

        save(genDatasourceConf);

        return Boolean.TRUE;
    }

    @Override
    public boolean updateGenDatasourceConf(GenDatasourceConf genDatasourceConf) {
        // 校验配置合法性
        if (!checkDataSource(genDatasourceConf)) {
            return Boolean.FALSE;
        }
        //先移除
        SpringUtil.getBean(DynamicRoutingDataSource.class)
                .removeDataSource(baseMapper.selectById(genDatasourceConf.getId()).getName());

        // 添加动态数据源
        addDynamicDataSource(genDatasourceConf);

//        if (StrUtil.isNotBlank(genDatasourceConf.getPassword())) {
//            genDatasourceConf.setPassword(stringEncryptor.encrypt(genDatasourceConf.getPassword()));
//        }


        updateById(genDatasourceConf);
        return Boolean.TRUE;
    }

    @Override
    public boolean deleteGenDatasourceConf(String id) {
        SpringUtil.getBean(DynamicRoutingDataSource.class)
                .removeDataSource(getById(id).getName());
        removeById(id);
        return Boolean.TRUE;
    }

    public void addDynamicDataSource(GenDatasourceConf conf) {
        DataSourceProperty dataSourceProperty = new DataSourceProperty();
        dataSourceProperty.setPoolName(conf.getName());
        dataSourceProperty.setUrl(conf.getUrl());
        dataSourceProperty.setUsername(conf.getUsername());
        dataSourceProperty.setPassword(conf.getPassword());
        dataSourceProperty.setLazy(true);
        DataSource dataSource = hikariDataSourceCreator.createDataSource(dataSourceProperty);
        SpringUtil.getBean(DynamicRoutingDataSource.class).addDataSource(dataSourceProperty.getPoolName(),
                dataSource);
    }

    /**
     * 验证链接
     *
     * @param conf
     * @return
     */
    public Boolean checkDataSource(GenDatasourceConf conf) {
        try {
            DriverManager.getConnection(conf.getUrl(), conf.getUsername(), conf.getPassword());
        } catch (SQLException e) {
            log.error("数据源配置 {} , 获取链接失败", conf.getName(), e);
            return Boolean.FALSE;
        }
        return Boolean.TRUE;
    }
}
