json.array!(@retailinforms) do |retailinform|
  json.extract! retailinform, :id, :p_id, :max_demand, :min_demand, :r_inventory, :book_cost, :hold_cost, :cost, :price, :eoq, :rop
  json.url retailinform_url(retailinform, format: :json)
end
