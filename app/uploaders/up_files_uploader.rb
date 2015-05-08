# encoding: utf-8

class UpFilesUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  include CarrierWave::MiniMagick


  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/sites/#{model.site_id}/#{model.class.to_s.underscore}/#{model.id}"
  end


  def extension_white_list
    %w(jpg jpeg gif png)
  end



  version :thumb do
    process :resize_and_pad => [140, 140]
  end

  def filename
    original_filename.parameterize + "." + file.extension if original_filename
  end

end
