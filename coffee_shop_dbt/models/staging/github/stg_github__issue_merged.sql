with source as (
    select * from {{ source('github', 'issue_merged' )}}
),

renamed as (
    select
        issue_id, 
        actor_id as merge_user_id,
        commit_sha,
        merged_at
        -- excluded cols
        -- _fivetran_synced,
    from source
        
)

select * from renamed