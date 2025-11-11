{%macro margin_percent (revenue, purchase_cost, precision=2)%}
round (safe_divide({{revenue}} - {{purchase_cost}}), {{revenue}} ), {{precision}} )
{%endmacro%}

