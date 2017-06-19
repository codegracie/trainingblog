CarrierWave.configure do |config|
  if Rails.env.development?
    config.storage = :file
  elsif Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
    config.fog_credentials = {
      provider:               'AWS',
      aws_access_key_id:      Rails.configuration.aws.access_key_id,
      aws_secret_access_key:  Rails.configuration.aws.secret_access_key,
    }
    config.fog_directory  = Rails.configuration.files.aws_bucket
  end
end