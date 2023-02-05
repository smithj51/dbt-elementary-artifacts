
{% macro quote(str) %}
    {% set escaped_str = str | replace("'","\\'")) %}
    {% do return("'{}'".format(escaped_str) %}
{% endmacro %}

{% macro dict_to_quoted_json(d) %}
    {% do return(elementary.quote(tojson(d))) %}
{% endmacro %}

{% macro quote_column(column_name) %}
    {{ adapter.dispatch('quote_column','elementary')(column_name) }}
{% endmacro %}

{%- macro default__quote_column(column_name) -%}
    {% if adapter.quote(column_name[1:-1]) == column_name %}
        {{ return(column_name) }}
    {% else %}
        {% set quoted_column = adapter.quote(column_name) %}
        {{ return(quoted_column) }}
    {% endif %}
{%- endmacro -%}

