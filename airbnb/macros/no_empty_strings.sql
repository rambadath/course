{% macro no_empty_strings(model) %}
{% set conditions = [] %}
{% for col in adapter.get_columns_in_relation(model) %}
    {% if col.is_string() %}
        {% do conditions.append(col.name ~ " IS NOT NULL AND " ~ col.name ~ " <> ''") %}
    {% endif %}
{% endfor %}
{{ conditions | join(" AND ") }}
{% endmacro %}