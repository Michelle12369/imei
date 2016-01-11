json.array!(@marketings) do |marketing|
  json.extract! marketing, :id, :p_id, :p_name, :r_inventory, :price, :price_origin, :increase, :profit, :valid_date, :retail_id
  json.url marketing_url(marketing, format: :json)
end
