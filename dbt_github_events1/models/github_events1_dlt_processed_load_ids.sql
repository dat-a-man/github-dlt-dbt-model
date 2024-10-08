{{
    config(
        materialized='incremental'
    )
}}
-- depends_on: {{ ref('dim_github_events1___dlt_loads') }}
-- depends_on: {{ ref('dim_github_events1__pull_request_review_comment_event') }}
-- depends_on: {{ ref('dim_github_events1__pull_request_review_event') }}
-- depends_on: {{ ref('dim_github_events1__issue_comment_event') }}
-- depends_on: {{ ref('dim_github_events1__fork_event') }}
-- depends_on: {{ ref('dim_github_events1__watch_event') }}
-- depends_on: {{ ref('dim_github_events1__pull_request_event') }}
-- depends_on: {{ ref('dim_github_events1__push_event') }}
-- depends_on: {{ ref('dim_github_events1__issues_event') }}
-- depends_on: {{ ref('dim_github_events1__create_event') }}
-- depends_on: {{ ref('dim_github_events1__push_event__payload__commits') }}
/* we save all currently active load ids into the processed ids table */
select load_id, {{ current_timestamp() }} as inserted_at FROM {{ ref('github_events1_dlt_active_load_ids') }}