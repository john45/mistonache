class EventPosterUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [50, 50]
  end

  version :medium do
    process :resize_to_fill => [160, 240]
  end

  version :big do
    process :resize_to_fill => [300, 450]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end