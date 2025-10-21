with source as (
    select * from {{ ref("orders_csv") }}
),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        case
            when status = 'completed' then 'completed'
            when status = 'placed' then 'placed'
            when status = 'shipped' then 'shipped'
            when status = 'return_pending' then 'return_pending'
            else null
        end as status,
        try_strptime(order_date::string, '%Y-%m-d') as order_date

    from source

)

select * from renamed
