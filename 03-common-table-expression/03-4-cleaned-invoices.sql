WITH cleaned_invoices AS (
    SELECT
        invoice_id,
        invoice_date
    FROM store.invoice
    WHERE billing_country = 'Germany'
), 

detailed_invoice_lines AS (
    SELECT
        invoiceline.invoice_id,
        invoiceline.invoice_line_id,
        track.name,
        invoiceline.unit_price,
        invoiceline.quantity,
    FROM store.invoiceline
    LEFT JOIN store.track ON invoiceline.track_id = track.track_id
)

SELECT
    ci.invoice_id,
    ci.invoice_date,
    dil.name,
    -- Find the total amount for the line
    dil.unit_price * dil.quantity AS line_amount
FROM detailed_invoice_lines AS dil

-- JOIN the cleaned_invoices and detailed_invoice_lines CTEs
LEFT JOIN cleaned_invoices AS ci ON dil.invoice_id = ci.invoice_id
ORDER BY ci.invoice_id, line_amount;
