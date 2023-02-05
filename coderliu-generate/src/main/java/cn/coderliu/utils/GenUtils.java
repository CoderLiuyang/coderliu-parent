package cn.coderliu.utils;


import cn.coderliu.model.GenDatasourceConf;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.config.TemplateType;
import com.baomidou.mybatisplus.generator.config.rules.DateType;

import java.util.*;

public class GenUtils {

    public static void gen(String tableName, String serverName, GenDatasourceConf genDatasourceConf) {
        String dir = System.getProperty("user.dir");
        FastAutoGenerator.create(genDatasourceConf.getUrl(), genDatasourceConf.getUsername(), genDatasourceConf.getPassword())
                .globalConfig(builder -> {
                    builder.author("liu") // 设置作者
                            .dateType(DateType.ONLY_DATE)
                            .outputDir(dir + "/" + serverName + "/src/main/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("cn.coderliu") // 设置父包名
                            .entity("model")
                            .mapper("mapper")
                            .service("service")
                            .serviceImpl("service.impl")
                            .controller("controller")
                            .pathInfo(Collections.singletonMap(OutputFile.xml, dir + "/" + serverName + "/src/main/resources/mapper")); // 设置mapperXml生成路径
                })
                //注入表名
                .strategyConfig(builder -> {
                    builder.addInclude(tableName);
                })
                //设置实体配置
                .strategyConfig(builder -> {
                    builder.entityBuilder()
                            .addSuperEntityColumns("id", "create_by", "create_time", "update_by", "update_time", "del_flag", "version")
                            .superClass("cn.coderliu.model.BaseModel");
                })
                //注入service名字
                .strategyConfig(builder -> {
                    builder.serviceBuilder().formatServiceFileName("%sService");
                })
                .templateConfig(builder -> {
                    builder.disable(TemplateType.ENTITY)
                            .entity("/vm/model.java")
                            .service("/vm/service.java")
                            .serviceImpl("/vm/serviceImpl.java")
                            .mapper("/vm/mapper.java")
                            .xml("/vm/mapper.xml")
                            .controller("/vm/controller.java");
                })

                .injectionConfig(consumer -> {
                    Map<String, String> customFile = new HashMap<>();
                    // DTO
                    customFile.put("Dto.java", "/vm/dto.java.ftl");
                    customFile.put("Vo.java", "/vm/vo.java.ftl");
                    customFile.put("Page.java", "/vm/page.java.ftl");
                    consumer.customFile(customFile);
                })
                .templateEngine(new CustomFreemarkerTemplateEngine())
                .execute();
    }


    public static String toLowerCaseFirstOne(String s) {
        if (Character.isLowerCase(s.charAt(0))) {
            return s;
        } else {
            return (new StringBuilder()).append(Character.toLowerCase(s.charAt(0))).append(s.substring(1)).toString();
        }
    }
}
