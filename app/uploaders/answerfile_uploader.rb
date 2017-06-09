class AnswerfileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :thumb do
    process resize_to_fit: [200, 200]
  end

  version :large do
    process resize_to_fit: [900, 900]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
