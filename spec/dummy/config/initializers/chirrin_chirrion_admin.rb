require 'redis'

ChirrinChirrionAdmin.setup do |config|
  redis_connection = Redis.new
  redis_adapter    = ChirrinChirrion::DatabaseAdapters::RedisAdapter.new(redis_connection)
  config.database_atapter = redis_adapter
  ChirrinChirrion.config(database_adapter: config.database_atapter)
end
