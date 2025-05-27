with orders as (
    select * from {{ ref('int_orders') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

joined as (
    select 
       order_items.*,
        location_id,
        customer_id,
        order_total,
        tax_paid, 
        ordered_at,
        customer_name,
        location_name,
        tax_rate,
        location_opened_at

    from orders 
        inner join order_items 
            on orders.order_id = order_items.order_id
)

select * from joined