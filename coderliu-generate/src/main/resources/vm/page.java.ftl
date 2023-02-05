package cn.coderliu.page;

<#list importList as i>
    ${i}
</#list>
import lombok.*;
import lombok.experimental.Accessors;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * ${table.comment} 分页对象
 * @author ${author}
 * @since ${date}
 */

@Data
@Builder
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class ${entity}Page extends Page{

    private String id;

    <#list fields as field>
        /**
         * ${field.comment}
         */
        private ${field.propertyType} ${field.propertyName};
   </#list>
}
