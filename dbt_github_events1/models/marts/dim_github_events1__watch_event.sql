/* Table: watch_event */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t."id",
    t."type",
    t."actor__id",
    t."actor__login",
    t."actor__display_login",
    t."actor__gravatar_id",
    t."actor__url",
    t."actor__avatar_url",
    t."repo__id",
    t."repo__name",
    t."repo__url",
    t."payload__action",
    t."public",
    t."created_at",
    t."org__id",
    t."org__login",
    t."org__gravatar_id",
    t."org__url",
    t."org__avatar_url",
    t."_dlt_load_id",
    t."_dlt_id",
FROM  {{ ref('stg_github_events1__watch_event') }} as t