package cn.coderliu.model;

import lombok.Data;


/**
 * 数据库配置对象
 */
@Data
public class GenDatasourceConf extends BaseModel{



    private String name;

    private String url;

    private String username;

    private String password;




}
