json.extract! blog, :id, :title, :description, :body, :tags, :reference, :published, :user_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
