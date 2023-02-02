package cn.coderliu;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableField;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author liu
 */
public class CodeGenerator {
//    /**
//     * <p>
//     * 读取控制台内容
//     * </p>
//     */
//    public static String scanner(String tip) {
//        Scanner scanner = new Scanner(System.in);
//        StringBuilder help = new StringBuilder();
//        help.append("请输入" + tip + "：");
//        System.out.println(help.toString());
//        if (scanner.hasNext()) {
//            String ipt = scanner.next();
//            if (StringUtils.isNotBlank(ipt)) {
//                return ipt;
//            }
//        }
//        throw new MybatisPlusException("请输入正确的" + tip + "！");
//    }
//
//    public static void main(String[] args) {
//        // 代码生成器
//        AutoGenerator mpg = new AutoGenerator();
//
//        // 全局配置
//        GlobalConfig gc = new GlobalConfig();
//        String projectPath = System.getProperty("user.dir") + "/" + scanner("输入服务名");
//        gc.setOutputDir(projectPath + "/src/main/java");
//        gc.setAuthor("liu");
//        gc.setOpen(false);
//        gc.setServiceName("%sService");
//        gc.setDateType(DateType.ONLY_DATE);
//
//        mpg.setGlobalConfig(gc);
//
//        // 数据源配置
//        DataSourceConfig dsc = new DataSourceConfig();
//        dsc.setUrl("jdbc:mysql://localhost:3306/coderliu-web-test?useUnicode=true&useSSL=false&characterEncoding=utf8");
//        // dsc.setSchemaName("public");
//        dsc.setDriverName("com.mysql.jdbc.Driver");
//        dsc.setUsername("root");
//        dsc.setPassword("123456");
//        mpg.setDataSource(dsc);
//
//        // 包配置
//        PackageConfig pc = new PackageConfig();
//        //pc.setModuleName(scanner("模块名"));
//        pc.setParent("cn.coderliu");
//        pc.setEntity("model");
//
//
//        mpg.setPackageInfo(pc);
//
//        // 自定义配置
//        InjectionConfig cfg = new InjectionConfig() {
//            @Override
//            public void initMap() {
//                Map<String, Object> map = new HashMap<>();
//                map.put("author", this.getConfig().getGlobalConfig().getAuthor());
//                map.put("entityName", this.getConfig().getTableInfoList().get(0).getEntityName());
//                map.put("entityPath", this.getConfig().getTableInfoList().get(0).getEntityPath());
//                List<TableField> fields = this.getConfig().getTableInfoList().get(0).getFields();
//                map.put("fields", fields);
//                map.put("fieldsList", fields.stream().map(TableField::getCapitalName).collect(Collectors.toList()));
//                map.put("comment", fields.stream().map(a -> "\"" + a.getComment() + "\"").collect(Collectors.joining(",")));
//                map.put("fieldNames", fields.stream().map(a -> "\"" + a.getColumnName() + "\"").collect(Collectors.joining(",")));
//                map.put("service", this.getConfig().getTableInfoList().get(0).getServiceName());
//                map.put("serviceName", toLowerCaseFirstOne(this.getConfig().getTableInfoList().get(0).getServiceName()));
//                map.put("date", new Date());
//                map.put("table", this.getConfig().getTableInfoList().get(0));
//                Map<String, String> importMap = new HashMap<>(16);
//                fields.forEach(a -> {
//                    String propertyType = a.getPropertyType();
//                    if (propertyType.equals("Date")) {
//                        importMap.put(a.getPropertyType(), "import java.util.Date;");
//                    }
//                    if (propertyType.equals("BigDecimal")) {
//                        importMap.put(a.getPropertyType(), "import java.math.BigDecimal;");
//                    }
//                });
//                List<String> importList = importMap.entrySet().stream().map(Map.Entry::getValue).collect(Collectors.toList());
//                map.put("importList", importList);
//                this.setMap(map);
//            }
//        };
//
//        // 如果模板引擎是 freemarker
////        String templatePath = "/templates/mapper.xml.ftl";
////        // 如果模板引擎是 velocity
////        // String templatePath = "/templates/mapper.xml.vm";
////
//        // 自定义输出配置
//        List<FileOutConfig> focList = new ArrayList<>();
//        // 自定义配置会被优先输出
//        focList.add(new FileOutConfig("dto.java.vm") {
//            @Override
//            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
//                return projectPath + "/src/main/java/cn/coderliu/dto/" + tableInfo.getEntityName() + "Dto" + StringPool.DOT_JAVA;
//            }
//        });
//        focList.add(new FileOutConfig("vo.java.vm") {
//            @Override
//            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
//                return projectPath + "/src/main/java/cn/coderliu/vo/" + tableInfo.getEntityName() + "Vo" + StringPool.DOT_JAVA;
//            }
//        });
//        focList.add(new FileOutConfig("controller.java.vm") {
//            @Override
//            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
//                return projectPath + "/src/main/java/cn/coderliu/controller/" + tableInfo.getEntityName() + "Controller" + StringPool.DOT_JAVA;
//            }
//        });
//        focList.add(new FileOutConfig("mapper.xml.vm") {
//            @Override
//            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
//                return projectPath + "/src/main/resources/mapper/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
//            }
//        });
//        focList.add(new FileOutConfig("model.java.vm") {
//            @Override
//            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
//                return projectPath + "/src/main/java/cn/coderliu/model/" + tableInfo.getEntityName() + StringPool.DOT_JAVA;
//            }
//        });
//        cfg.setFileOutConfigList(focList);
//        mpg.setCfg(cfg);
//
//        // 配置模板
//        TemplateConfig templateConfig = new TemplateConfig();
//        templateConfig.disable(TemplateType.XML);
//        // 配置自定义输出模板
//        //指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别
//        // templateConfig.setEntity("templates/entity2.java");
//        // templateConfig.setService();
//        // templateConfig.setController();
//
//        //templateConfig.setXml(null);
//        mpg.setTemplate(templateConfig);
//
//        // 策略配置
//        StrategyConfig strategy = new StrategyConfig();
//        strategy.setNaming(NamingStrategy.underline_to_camel);
//        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
//        strategy.setSuperEntityClass("cn.coderliu.model.BaseModel");
//        strategy.setEntityLombokModel(true);
//        strategy.setRestControllerStyle(true);
//        // 公共父类
//        //strategy.setSuperControllerClass("你自己的父类控制器,没有就不用设置!");
//        // 写于父类中的公共字段
//        strategy.setSuperEntityColumns("id", "create_by", "create_time", "update_by", "update_time", "del_flag", "version");
//        strategy.setInclude(scanner("表名").split(","));
//        strategy.setControllerMappingHyphenStyle(true);
//     //   strategy.setTablePrefix(pc.getModuleName() + "_");
//        mpg.setStrategy(strategy);
//        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
//        mpg.execute();
//    }
//
//
//    public static String toLowerCaseFirstOne(String s) {
//        if (Character.isLowerCase(s.charAt(0))) {
//            return s;
//        } else {
//            return (new StringBuilder()).append(Character.toLowerCase(s.charAt(0))).append(s.substring(1)).toString();
//        }
//
//    }

}
