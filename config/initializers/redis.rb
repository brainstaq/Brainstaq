if ENV['REDIS_URL'].present?
  uri = URI.parse(ENV['REDIS_URL'])
  REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password)
else
  REDIS = Redis.new
end

# $redis = Redis.new(url: ENV["REDIS_URL"], ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
