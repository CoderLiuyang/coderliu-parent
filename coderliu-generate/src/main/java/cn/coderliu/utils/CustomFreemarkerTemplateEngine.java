package cn.coderliu.utils;

import cn.hutool.Hutool;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.generator.config.ConstVal;
import com.baomidou.mybatisplus.generator.config.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.builder.CustomFile;
import com.baomidou.mybatisplus.generator.config.po.TableField;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.extern.slf4j.Slf4j;

import javax.validation.constraints.NotNull;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 自定义模版引擎
 */
@Slf4j
public class CustomFreemarkerTemplateEngine extends FreemarkerTemplateEngine {
    private Configuration configuration;

    private Map<String, Object> paramMap = new HashMap<>();


    @Override
    public FreemarkerTemplateEngine init(@NotNull ConfigBuilder configBuilder) {
        configuration = new Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
        configuration.setDefaultEncoding(ConstVal.UTF8);
        configuration.setClassForTemplateLoading(FreemarkerTemplateEngine.class, StringPool.SLASH);
        paramMap.put("author", configBuilder.getGlobalConfig().getAuthor());
        paramMap.put("entityName", configBuilder.getTableInfoList().get(0).getEntityName());
        paramMap.put("entityPath", configBuilder.getTableInfoList().get(0).getEntityPath());
        List<TableField> fields = configBuilder.getTableInfoList().get(0).getFields();
        paramMap.put("fields", fields);
        paramMap.put("fieldsList", fields.stream().map(TableField::getCapitalName).collect(Collectors.toList()));
        paramMap.put("comment", fields.stream().map(a -> "\"" + a.getComment() + "\"").collect(Collectors.joining(",")));
        paramMap.put("fieldNames", fields.stream().map(a -> "\"" + a.getColumnName() + "\"").collect(Collectors.joining(",")));
        paramMap.put("service", configBuilder.getTableInfoList().get(0).getServiceName());
        paramMap.put("serviceName", toLowerCaseFirstOne(configBuilder.getTableInfoList().get(0).getServiceName()));
        paramMap.put("date", DateUtil.formatDate(new Date()));
        paramMap.put("table", configBuilder.getTableInfoList().get(0));
        Map<String, String> importMap = new HashMap<>(16);
        fields.forEach(a -> {
            String propertyType = a.getPropertyType();
            if (propertyType.equals("Date")) {
                importMap.put(a.getPropertyType(), "import java.util.Date;");
            }
            if (propertyType.equals("BigDecimal")) {
                importMap.put(a.getPropertyType(), "import java.math.BigDecimal;");
            }
        });
        List<String> importList = importMap.entrySet().stream().map(Map.Entry::getValue).collect(Collectors.toList());
        paramMap.put("importList", importList);
        return this;
    }

    @Override
    public void writer(@NotNull Map<String, Object> objectMap, @NotNull String templatePath, @NotNull File outputFile) throws Exception {


        objectMap.putAll(paramMap);
        Template template = configuration.getTemplate(templatePath);
        try (FileOutputStream fileOutputStream = new FileOutputStream(outputFile)) {
            template.process(objectMap, new OutputStreamWriter(fileOutputStream, ConstVal.UTF8));
        }
        log.info("模板:" + templatePath + ";  文件:" + outputFile);
    }


    /**
     * 输出自定义模板文件
     *
     * @param customFiles 自定义模板文件列表
     * @param tableInfo   表信息
     * @param objectMap   渲染数据
     * @since 3.5.3
     */
    protected void outputCustomFile(@NotNull List<CustomFile> customFiles, @NotNull TableInfo tableInfo, @NotNull Map<String, Object> objectMap) {
        //加入自定义配置
        objectMap.putAll(paramMap);

        String entityName = tableInfo.getEntityName();
        String parentPath = getPathInfo(OutputFile.parent);
        customFiles.forEach(file -> {
            String filePath = StringUtils.isNotBlank(file.getFilePath()) ? file.getFilePath() : parentPath;
            //基于自定义类型拼接路径啊
            filePath = filePath + File.separator + toLowerCaseFirstOne(file.getFileName().split("\\.")[0]);
            if (StringUtils.isNotBlank(file.getPackageName())) {
                filePath = filePath + File.separator + file.getPackageName();
                filePath = filePath.replaceAll("\\.", StringPool.BACK_SLASH + File.separator);
            }
            String fileName = filePath + File.separator + entityName + file.getFileName();
            outputFile(new File(fileName), objectMap, file.getTemplatePath(), file.isFileOverride());
        });
    }


    public static String toLowerCaseFirstOne(String s) {
        if (Character.isLowerCase(s.charAt(0))) {
            return s;
        } else {
            return (new StringBuilder()).append(Character.toLowerCase(s.charAt(0))).append(s.substring(1)).toString();
        }
    }

}
