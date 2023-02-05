export const tableOption = {
  "border": true,
  "index": true,
  "indexLabel": "序号",
  "stripe": true,
  "menuAlign": "center",
  "align": "center",
  "searchMenuSpan": 6,
  "column": [
#foreach ($column in fields)
## 当列是主键 或者 列是审计字段时候， 新增不显示，编辑的时候显示单不能编辑
    {
      "type": "input",
      "label": "$column.comments",
      "prop": "$column.lowerAttrName"
    }#if($foreach.hasNext),#end
#end
  ]
}
