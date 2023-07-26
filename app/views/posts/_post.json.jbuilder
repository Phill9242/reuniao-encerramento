json.extract! post, :id, :dev_id, :description, :date, :status, :good_bad, :created_at, :updated_at
json.url post_url(post, format: :json)
