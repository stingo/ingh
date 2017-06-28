json.extract! page, :id, :name, :pagedesc, :created_at, :updated_at
json.url page_url(page, format: :json)
