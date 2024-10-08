{{
    config(
        materialized='incremental'
    )
}}
-- depends_on: {{ ref('dim_github_reactions___dlt_loads') }}
-- depends_on: {{ ref('dim_github_reactions__pull_requests') }}
-- depends_on: {{ ref('dim_github_reactions__issues') }}
-- depends_on: {{ ref('dim_github_reactions__issues__comments') }}
-- depends_on: {{ ref('dim_github_reactions__issues__reactions') }}
-- depends_on: {{ ref('dim_github_reactions__issues__comments__reactions') }}
-- depends_on: {{ ref('dim_github_reactions__pull_requests__comments') }}
-- depends_on: {{ ref('dim_github_reactions__pull_requests__comments__reactions') }}
-- depends_on: {{ ref('dim_github_reactions__pull_requests__reactions') }}
/* we save all currently active load ids into the processed ids table */
select load_id, {{ current_timestamp() }} as inserted_at FROM {{ ref('github_reactions_dlt_active_load_ids') }}