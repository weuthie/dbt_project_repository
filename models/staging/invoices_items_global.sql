{{ config(materialized='view') }}

WITH source_invoices AS (

SELECT * FROM {{ source("staging","invoices") }}

),
source_invoices_item AS (

SELECT * FROM {{ source("staging","invoice_items") }}

),
final AS (

    SELECT
    source_invoices.InvoiceId, 
    source_invoices.CustomerId,
    source_invoices.InvoiceDate,
    source_invoices.BillingAddress, 
    source_invoices.BillingCity, 
    source_invoices.BillingState, 
    source_invoices.BillingCountry, 
    source_invoices.BillingPostalCode, 
    source_invoices.Total,
    source_invoices_item.InvoiceLineId,
    source_invoices_item.TrackId, 
    source_invoices_item.UnitPrice, 
    source_invoices_item.Quantity
    FROM source_invoices
    RIGHT JOIN  source_invoices_item ON source_invoices.InvoiceId = source_invoices_item.InvoiceId

)

SELECT * FROM final

