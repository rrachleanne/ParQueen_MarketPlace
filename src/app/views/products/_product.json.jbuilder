json.extract! product, :id, :vendor_id, :customer_id, :state, :suburb, :category, :price, :availability, :picture, :created_at, :updated_at
json.url product_url(product, format: :json)
