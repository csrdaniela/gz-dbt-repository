{%macro margin_percent (revenue, purchase_cost, macro_var=2)%}
safe_divide({{revenue}} - {{purchase_cost}}), {{revenue}}
{%endmacro%}