$lock_manager = Redlock::Client.new(["redis://127.0.0.1:6379/0"])
