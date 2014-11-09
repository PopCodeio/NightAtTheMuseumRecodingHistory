# encoding: utf-8
class FileUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # Process files as they are uploaded:
  #process :watermark

  #def watermark
  #  manipulate! do |img|
  #    logo = Magick::Image.read("#{Rails.root}/app/assets/images/watermark.png").first
  #    img = img.composite(logo, Magick::SouthEastGravity, 15, 0, Magick::OverCompositeOp)
  #  end
  #  manipulate! do |img|
  #    logo = Magick::Image.read("#{Rails.root}/app/assets/images/HistoryMiami_Logo.png").first
  #    img = img.composite(logo, Magick::NorthWestGravity, 15, 0, Magick::OverCompositeOp)
  #  end
  #end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

# version :p50x50 do
#   process :resize_and_pad => [50,50]
# end
end
