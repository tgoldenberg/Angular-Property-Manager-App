json.array!(@orders) do |order|
  json.extract! order, :id, :address, :references, :pay_type
  json.url order_url(order, format: :json)
end
