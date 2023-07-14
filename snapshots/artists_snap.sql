{% snapshot artists_snap %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='ArtistId',
          check_cols=['Name'],
        )
    }}

    select * from {{ source('staging', 'artists') }}

{% endsnapshot %}