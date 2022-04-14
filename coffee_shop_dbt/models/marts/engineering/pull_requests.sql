with 

pull_requests as (select * from {{ ref('stg_github__pull_requests') }}),                           

repository as (select * from {{ ref('stg_github__repository') }}),

issues as (select * from {{ ref('stg_github__issues') }}),

issue_merged as (select * from {{ ref('stg_github__issue_merged') }}),

final as (

select

    pull_requests.pull_request_id,
    repository.name as repo_name,
    issues.number as pull_request_number,
    -- fix type col later
    cast(null as string) as type, -- (bug, eng, feature)
    cast(null as string) as state,
    -- case
        -- when pull_requests.is_draft then 'draft'
        -- when pull_requests.merged_at then 'merged'
        -- when issues.closed_at then 'closed_without_merge'
        -- else 'open'
    -- end as state, -- (open, draft, closed_without_merge, merged)
    issues.created_at,
    issue_merged.merged_at,
    timestamp_diff(issues.created_at, issue_merged.merged_at, DAY) / 24 as days_open_to_merge

from pull_requests

left join repository
    on pull_requests.head_repo_id = repository.repository_id

left join issues   
    on pull_requests.issue_id = issues.issue_id

left join issue_merged
    on pull_requests.issue_id = issue_merged.issue_id
)

select * from final