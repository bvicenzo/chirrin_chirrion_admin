require 'redis'

ChirrinChirrionAdmin.setup do |config|
  redis_adapter = ChirrinChirrion::DatabaseAdapters::RedisAdapter.new(Redis.new)
  config.database_atapter = redis_adapter
end
