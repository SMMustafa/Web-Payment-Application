json.extract! payment, :id, :recipient_name, :recipient_email, :amount, :comment, :user_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
