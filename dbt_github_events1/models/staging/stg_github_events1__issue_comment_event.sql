/* Table: issue_comment_event */
{{
    config(
        materialized='table'
    )
}}

-- depends_on: {{ ref('github_events1_dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'issue_comment_event' */
    "id",
    "type",
    "actor__id",
    "actor__login",
    "actor__display_login",
    "actor__gravatar_id",
    "actor__url",
    "actor__avatar_url",
    "repo__id",
    "repo__name",
    "repo__url",
    "payload__action",
    "payload__issue__url",
    "payload__issue__repository_url",
    "payload__issue__labels_url",
    "payload__issue__comments_url",
    "payload__issue__events_url",
    "payload__issue__html_url",
    "payload__issue__id",
    "payload__issue__node_id",
    "payload__issue__number",
    "payload__issue__title",
    "payload__issue__user",
    "payload__issue__labels",
    "payload__issue__state",
    "payload__issue__locked",
    "payload__issue__assignees",
    "payload__issue__comments",
    "payload__issue__created_at",
    "payload__issue__updated_at",
    "payload__issue__author_association",
    "payload__issue__draft",
    "payload__issue__pull_request",
    "payload__issue__body",
    "payload__issue__reactions",
    "payload__issue__timeline_url",
    "payload__comment__url",
    "payload__comment__html_url",
    "payload__comment__issue_url",
    "payload__comment__id",
    "payload__comment__node_id",
    "payload__comment__user",
    "payload__comment__created_at",
    "payload__comment__updated_at",
    "payload__comment__author_association",
    "payload__comment__body",
    "payload__comment__reactions",
    "public",
    "created_at",
    "org__id",
    "org__login",
    "org__gravatar_id",
    "org__url",
    "org__avatar_url",
    "_dlt_load_id",
    "_dlt_id",
    "payload__issue__assignee",
    "payload__issue__closed_at",
    "payload__issue__state_reason",
    "payload__issue__milestone",
    "payload__comment__performed_via_github_app",
FROM {{ source('raw_data', 'issue_comment_event') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE "_dlt_load_id" IN ( SELECT "load_id" FROM  {{ ref('github_events1_dlt_active_load_ids') }} )