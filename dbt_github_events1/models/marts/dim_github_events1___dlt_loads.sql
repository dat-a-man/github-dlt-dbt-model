/* Table: _dlt_loads */
{{
    config(
        materialized='incremental'
    )
}}
/* Description: Created by DLT. Tracks completed loads */
SELECT
    t."load_id",
    t."schema_name",
    t."status",
    t."inserted_at",
    t."schema_version_hash",
FROM  {{ ref('stg_github_events1___dlt_loads') }} as t