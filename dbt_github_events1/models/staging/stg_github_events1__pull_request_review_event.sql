/* Table: pull_request_review_event */
{{
    config(
        materialized='table'
    )
}}

-- depends_on: {{ ref('github_events1_dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'pull_request_review_event' */
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
    "payload__review__id",
    "payload__review__node_id",
    "payload__review__user",
    "payload__review__commit_id",
    "payload__review__submitted_at",
    "payload__review__state",
    "payload__review__html_url",
    "payload__review__pull_request_url",
    "payload__review__author_association",
    "payload__review___links",
    "payload__pull_request__url",
    "payload__pull_request__id",
    "payload__pull_request__node_id",
    "payload__pull_request__html_url",
    "payload__pull_request__diff_url",
    "payload__pull_request__patch_url",
    "payload__pull_request__issue_url",
    "payload__pull_request__number",
    "payload__pull_request__state",
    "payload__pull_request__locked",
    "payload__pull_request__title",
    "payload__pull_request__user",
    "payload__pull_request__body",
    "payload__pull_request__created_at",
    "payload__pull_request__updated_at",
    "payload__pull_request__merge_commit_sha",
    "payload__pull_request__assignee",
    "payload__pull_request__assignees",
    "payload__pull_request__requested_reviewers",
    "payload__pull_request__requested_teams",
    "payload__pull_request__labels",
    "payload__pull_request__draft",
    "payload__pull_request__commits_url",
    "payload__pull_request__review_comments_url",
    "payload__pull_request__review_comment_url",
    "payload__pull_request__comments_url",
    "payload__pull_request__statuses_url",
    "payload__pull_request__head",
    "payload__pull_request__base",
    "payload__pull_request___links",
    "payload__pull_request__author_association",
    "public",
    "created_at",
    "org__id",
    "org__login",
    "org__gravatar_id",
    "org__url",
    "org__avatar_url",
    "_dlt_load_id",
    "_dlt_id",
    "payload__review__body",
FROM {{ source('raw_data', 'pull_request_review_event') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE "_dlt_load_id" IN ( SELECT "load_id" FROM  {{ ref('github_events1_dlt_active_load_ids') }} )