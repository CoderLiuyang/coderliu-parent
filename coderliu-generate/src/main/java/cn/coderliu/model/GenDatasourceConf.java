package cn.coderliu.model;

import lombok.Data;


/**
 * 数据库配置对象
 */
@Data
public class GenDatasourceConf {


    private Long id;

    private String name;

    private String url;

    private String username;

    private String password;



    private Boolean delFlag;
}
