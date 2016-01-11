json.array!(@materials) do |material|
  json.extract! material, :id, :m_id, :m_name, :m_cost, :supplier, :transportation_time, :number, :result, :quality, :s_address, :s_phone, :condition
  json.url material_url(material, format: :json)
end
