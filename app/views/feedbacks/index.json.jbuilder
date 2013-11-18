json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :name, :phone, :email, :description
  json.url feedback_url(feedback, format: :json)
end
