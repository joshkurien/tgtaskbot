Sidekiq.configure_client do |config|
  config.redis = {url: "redis://#{Figaro.env.REDIS_HOST}"}
end

Sidekiq.configure_server do |config|
  config.redis = {url: "redis://#{Figaro.env.REDIS_HOST}"}
end
