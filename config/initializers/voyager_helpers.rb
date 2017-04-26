include VoyagerHelpers::OracleConnection

VoyagerHelpers.configure do |config|
  # Columbia - fetch sensitive constants from app_config
  config.db_user     = APP_CONFIG['voyager_db_user']
  config.db_password = APP_CONFIG['voyager_db_password']
  config.db_name     = APP_CONFIG['voyager_db_name']
end
