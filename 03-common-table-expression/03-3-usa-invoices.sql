WITH usa_invoices AS (

SELECT
    invoice_id,
    billing_state,
FROM 
    INVOICE
WHERE
    billing_country = 'USA'

)

SELECT
    SUM(invoiceline.QUANTITY) AS total_sales,
    usa_invoices.billing_state
FROM usa_invoices
LEFT JOIN invoiceline ON usa_invoices.invoice_id = invoiceline.invoice_id
GROUP BY usa_invoices.billing_state
ORDER BY total_sales DESC