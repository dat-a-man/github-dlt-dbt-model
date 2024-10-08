# github_events1 DBT Project


## Incremental loading / Lineage

This project supports incremental loading based on dlt_load_ids. Every load package in dlt 
is assigned a unique `load_id`, and every row in the dataset includes a column referencing the 
`load_id` it originated from. Child tables reference their parent and root tables, 
allowing them to be associated with a load package through a simple join operation.

To ensure that only new load packages are processed, this dbt project includes two special tables 
within the destination dataset:

### github_events1_dlt_active_load_ids

At the beginning of each dbt run, this table is populated with all load_ids that were 
successful (status is 0) and have not yet been processed in previous dbt runs. These are 
referred to as active load_ids. The staging tables are then populated only with rows 
associated with these active load_ids.

### github_events1_dlt_processed_load_ids

At the end of each dbt run, the active load_ids are recorded in this table, 
along with the current timestamp. This allows you to trace when each load_id was processed. 
Additionally, this table (if present) is checked at the beginning of each dbt run to determine 
which load_ids have already been processed, ensuring that only new data is handled.

Staging and Mart tables for the following source tables where created:
* _dlt_loads
* pull_request_review_comment_event
* pull_request_review_event
* issue_comment_event
* fork_event
* watch_event
* pull_request_event
* push_event
* issues_event
* create_event
* push_event__payload__commits