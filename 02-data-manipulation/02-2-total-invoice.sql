SELECT
    invoice_id,
    COUNT(invoice_id) AS total_invoice_lines
FROM store.invoiceline
GROUP BY invoice_id
HAVING total_invoice_lines > 10;