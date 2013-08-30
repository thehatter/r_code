json.array!(@sites) do |site|
  json.extract! site, :domain, :sub_domain, :name, :user_id
  json.url site_url(site, format: :json)
end
