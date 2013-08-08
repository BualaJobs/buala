# encoding: utf-8

class CompanyLogoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :resize_to_fit => [220, 55]

end
