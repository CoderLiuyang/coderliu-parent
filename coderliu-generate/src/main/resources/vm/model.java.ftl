package cn.coderliu.model;

<#list importList as i>
${i}
</#list>
import lombok.*;

/**
 * ${table.comment}
 * @author ${author}
 * @since ${date}
 */

@Data
@EqualsAndHashCode(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ${entity} extends BaseModel{
    <#list fields as field>
    /**
    * ${field.comment}
    */
    private ${field.propertyType} ${field.propertyName};
    </#list>
}
