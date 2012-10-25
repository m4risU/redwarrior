Airbrake.configure do |config|
  config.api_key = '5a9eefa18359dbec1af8ca3c4e6e67c1'
  config.host = 'errbit.redwarrior.pl'
  config.port = 80
  config.secure = config.port == 443
end