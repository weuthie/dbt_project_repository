{{ config(materialized='view') }}



SELECT
    invoices.InvoiceId, 
    invoices.CustomerId,
     invoices.InvoiceDate,
      invoices.BillingAddress, 
      invoices.BillingCity, 
      invoices.BillingState, 
      invoices.BillingCountry, 
      invoices.BillingPostalCode, 
      invoices.Total,
      invoice_items.InvoiceLineId,
       invoice_items.TrackId, 
       invoice_items.UnitPrice, 
       invoice_items.Quantity
    FROM {{ source("staging","invoices") }} 
    RIGHT JOIN {{ source("staging","invoice_items") }} ON invoices.InvoiceId = invoice_items.InvoiceId
