json.extract! echo, :id, :headline, :body, :image1, :videourl, :created_at, :updated_at
json.url echo_url(echo, format: :json)
