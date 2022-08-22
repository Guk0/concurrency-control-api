$lock_manager = Redlock::Client.new(
  ["redis://redis:6379/0"], {
    retry_count:   20,
    retry_delay:   200, # milliseconds
    retry_jitter:  200,  # milliseconds
    redis_timeout: 10  # seconds
  }
)

log_file_path = "#{Rails.root}/log/#{Rails.env}_redlock.log"
$redlock_logger = Logger.new(log_file_path)

