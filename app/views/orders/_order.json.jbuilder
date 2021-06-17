json.extract! order, :id, :weight, :service_type, :cost, :payment_mode, :status, :parcel_number, :created_at, :updated_at
json.url order_url(order, format: :json)
