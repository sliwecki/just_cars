require 'sidekiq/web'

redis_config = { url: Settings.redis.url }

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
