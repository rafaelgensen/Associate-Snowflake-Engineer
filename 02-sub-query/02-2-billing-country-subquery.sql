SELECT
	billing_country,
  SUM(total) AS total_invoice_amount
FROM store.invoice
WHERE invoice_id IN (
  SELECT
      invoice_id,
  FROM store.invoiceline
  GROUP BY invoice_id
  HAVING COUNT(invoice_id) > 10
)
GROUP BY billing_country;
