json.array!(@products) do |product|
  json.extract! product, :id, :p_id, :p_name, :p_inventory, :produce_date, :cost, :price, :factory
  json.url product_url(product, format: :json)
end
