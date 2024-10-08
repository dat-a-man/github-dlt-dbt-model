/* Table: pull_request_event */
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
    t."payload__number",
    t."payload__pull_request__url",
    t."payload__pull_request__id",
    t."payload__pull_request__node_id",
    t."payload__pull_request__html_url",
    t."payload__pull_request__diff_url",
    t."payload__pull_request__patch_url",
    t."payload__pull_request__issue_url",
    t."payload__pull_request__number",
    t."payload__pull_request__state",
    t."payload__pull_request__locked",
    t."payload__pull_request__title",
    t."payload__pull_request__user",
    t."payload__pull_request__body",
    t."payload__pull_request__created_at",
    t."payload__pull_request__updated_at",
    t."payload__pull_request__assignees",
    t."payload__pull_request__requested_reviewers",
    t."payload__pull_request__requested_teams",
    t."payload__pull_request__labels",
    t."payload__pull_request__draft",
    t."payload__pull_request__commits_url",
    t."payload__pull_request__review_comments_url",
    t."payload__pull_request__review_comment_url",
    t."payload__pull_request__comments_url",
    t."payload__pull_request__statuses_url",
    t."payload__pull_request__head",
    t."payload__pull_request__base",
    t."payload__pull_request___links",
    t."payload__pull_request__author_association",
    t."payload__pull_request__merged",
    t."payload__pull_request__mergeable_state",
    t."payload__pull_request__comments",
    t."payload__pull_request__review_comments",
    t."payload__pull_request__maintainer_can_modify",
    t."payload__pull_request__commits",
    t."payload__pull_request__additions",
    t."payload__pull_request__deletions",
    t."payload__pull_request__changed_files",
    t."public",
    t."created_at",
    t."org__id",
    t."org__login",
    t."org__gravatar_id",
    t."org__url",
    t."org__avatar_url",
    t."_dlt_load_id",
    t."_dlt_id",
    t."payload__pull_request__closed_at",
    t."payload__pull_request__merged_at",
    t."payload__pull_request__merge_commit_sha",
    t."payload__pull_request__merged_by",
    t."payload__pull_request__assignee",
    t."payload__pull_request__mergeable",
    t."payload__pull_request__rebaseable",
FROM  {{ ref('stg_github_events1__pull_request_event') }} as t