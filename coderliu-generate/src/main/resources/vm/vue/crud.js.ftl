export const tableOption = {
  "border": true,
  "index": true,
  "indexLabel": "序号",
  "stripe": true,
  "menuAlign": "center",
  "align": "center",
  "searchMenuSpan": 6,
  "column": [

<#list fields as field>
    {
    "type": "input",
    "label": "${field.comment}",
    "prop": "${field.propertyName}",
    "addDisplay": false,
    "editDisabled": true
    }
    <#if field_has_next>
        ,
    </#if>
</#list>
  ]
}
