package cn.coderliu.dto;

<#list importList as i>
    ${i}
</#list>
import lombok.*;
import lombok.experimental.Accessors;

/**
 * ${table.comment}
 * @author ${author}
 * @since ${date}
 */

@Data
@Builder
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class ${entity}Dto {

    private String id;


    <#list fields as field>
        /**
         * ${field.comment}
         */
        private ${field.propertyType} ${field.propertyName};
   </#list>
}
