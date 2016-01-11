json.array!(@retailers) do |retailer|
  json.extract! retailer, :id, :p_id, :p_name, :number_sold, :number_bought, :valid_date, :temp
  json.url retailer_url(retailer, format: :json)
end
