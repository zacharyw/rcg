$redis = nil

if Rails.env.production?
  Redis.new(url: ENV["REDIS_URL"])
end
