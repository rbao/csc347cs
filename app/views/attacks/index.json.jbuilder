json.array!(@attacks) do |attack|
  json.extract! attack, :vector, :ip
  json.url attack_url(attack, format: :json)
end
