json.extract! textbook, :id, :name, :image, :author, :publications, :created_at, :updated_at
json.url textbook_url(textbook, format: :json)
