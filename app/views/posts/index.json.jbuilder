json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :url, :current_clicks, :allowed_clicks, :user_id
  json.url post_url(post, format: :json)
end
