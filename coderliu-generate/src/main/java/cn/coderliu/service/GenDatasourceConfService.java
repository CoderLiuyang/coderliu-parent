package cn.coderliu.service;

import cn.coderliu.model.GenDatasourceConf;
import com.baomidou.mybatisplus.extension.service.IService;

public interface GenDatasourceConfService extends IService<GenDatasourceConf> {

    boolean saveGenDatasourceConf(GenDatasourceConf genDatasourceConf);

    boolean updateGenDatasourceConf(GenDatasourceConf genDatasourceConf);

    boolean deleteGenDatasourceConf(String id);


}
