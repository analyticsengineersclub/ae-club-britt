with source as (

    select * from {{ source('github', 'pull_request') }}

),

renamed as (

    select
        id as pull_request_id,
        issue_id,
        base_label,
        base_ref,
        base_repo_id,
        base_sha,
        base_user_id,
        is_draft,
        head_label,
        head_ref,
        head_repo_id,
        head_sha,
        head_user_id,
        merge_commit_sha
        -- exlcuded cols
        -- _fivetran_synced,


    from source

)

select * from renamed