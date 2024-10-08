/* Table: issues__comments__reactions */
/* Parent: issues__comments */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t."user__login",
    t."user__avatar_url",
    t."user__url",
    t."content",
    t."created_at",
    t."_dlt_parent_id",
    t."_dlt_list_idx",
    t."_dlt_id",
FROM  {{ ref('stg_github_reactions__issues__comments__reactions') }} as t
/* this join to the parent table is not necesarily needed for this template to work */
JOIN {{ ref('stg_github_reactions__issues__comments') }} as pt
ON (t."_dlt_parent_id" = pt."_dlt_id")