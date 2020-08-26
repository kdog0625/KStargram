require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials[:aws][:access_key_id],
    aws_secret_access_key: Rails.application.credentials[:aws][:secret_access_key],
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'kstargram0625'
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/kstargram0625'
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end
#fogの設定まで完了(カリキュラムS3の②)