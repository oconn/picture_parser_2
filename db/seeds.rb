require 'exifr'

# User.create(email: "abed@abed.com", user_name: "abed", password: "dreamatorium", password_confirmation: "dreamatorium")

class Image
  attr_reader :height, :width, :bits, :comment, :exif, :exif_data, :app1s, :thumbnail, :to_hash, :hash, :class, :singleton_class, :clone, :dup, :untaint, :to_s, :instance_variables, :object_id, :new_subfile_type, :subfile_type, :image_width, :image_length, :bits_per_sample, :compression, :photometric_interpretation, :threshholding, :cell_width, :cell_length, :fill_order, :document_name, :image_description, :make, :model, :strip_offsets, :orientation, :samples_per_pixel, :rows_per_strip, :strip_byte_counts, :min_sample_value, :max_sample_value, :x_resolution, :y_resolution, :planar_configuration, :page_name, :x_position, :y_position, :free_offsets, :free_byte_counts, :gray_response_unit, :gray_response_curve, :t4_options, :t6_options, :resolution_unit, :transfer_function, :software, :date_time, :artist, :host_computer, :predictor, :white_point, :primary_chromaticities, :color_map, :halftone_hints, :tile_width, :tile_length, :tile_offsets, :tile_byte_counts, :bad_fax_lines, :clean_fax_data, :consecutive_bad_fax_lines, :sub_ifds, :ink_set, :ink_names, :number_of_inks, :dot_range, :target_printer, :extra_samples, :transfer_range, :clip_path, :x_clip_path_units, :y_clip_path_units, :indexed, :jpeg_tables, :opi_proxy, :global_parameters_ifd, :profile_type, :fax_profile, :coding_methods, :version_year, :mode_number, :decode, :default_image_color, :jpegproc, :jpeg_interchange_format, :jpeg_interchange_format_length, :jpeg_restart_interval, :jpeg_lossless_predictors, :jpeg_point_transforms, :jpeg_q_tables, :jpeg_dc_tables, :jpeg_ac_tables, :ycb_cr_coefficients, :ycb_cr_sub_sampling, :ycb_cr_positioning, :reference_black_white, :strip_row_counts, :xmp, :image_id, :image_layer, :copyright, :iptc, :exposure_time, :f_number, :exposure_program, :spectral_sensitivity, :iso_speed_ratings, :oecf, :exif_version, :date_time_original, :date_time_digitized, :components_configuration, :compressed_bits_per_pixel, :shutter_speed_value, :aperture_value, :brightness_value, :exposure_bias_value, :max_aperture_value, :subject_distance, :metering_mode, :light_source, :flash, :focal_length, :subject_area, :maker_note, :user_comment, :subsec_time, :subsec_time_orginal, :subsec_time_digitized, :flashpix_version, :color_space, :pixel_x_dimension, :pixel_y_dimension, :related_sound_file, :flash_energy, :spatial_frequency_response, :focal_plane_x_resolution, :focal_plane_y_resolution, :focal_plane_resolution_unit, :subject_location, :exposure_index, :sensing_method, :file_source, :scene_type, :cfa_pattern, :custom_rendered, :exposure_mode, :white_balance, :digital_zoom_ratio, :focal_length_in_35mm_film, :scene_capture_type, :gain_control, :contrast, :saturation, :sharpness, :device_setting_description, :subject_distance_range, :image_unique_id, :gps_version_id, :gps_latitude_ref, :gps_latitude, :gps_longitude_ref, :gps_longitude, :gps_altitude_ref, :gps_altitude, :gps_time_stamp, :gps_satellites, :gps_status, :gps_measure_mode, :gps_dop, :gps_speed_ref, :gps_speed, :gps_track_ref, :gps_track, :gps_img_direction_ref, :gps_img_direction, :gps_map_datum, :gps_dest_latitude_ref, :gps_dest_latitude, :gps_dest_longitude_ref, :gps_dest_longitude, :gps_dest_bearing_ref, :gps_dest_bearing, :gps_dest_distance_ref, :gps_dest_distance, :gps_processing_method, :gps_area_information, :gps_date_stamp, :gps_differential, :gps

  @@array = [:height, :width, :bits, :comment, :exif, :exif_data, :app1s, :thumbnail, "image_width", "image_length", "bits_per_sample", "compression", "photometric_interpretation", "threshholding", "cell_width", "cell_length", "fill_order", "document_name", "image_description", "make", "model", "strip_offsets", "orientation", "samples_per_pixel", "rows_per_strip", "strip_byte_counts", "min_sample_value", "max_sample_value", "x_resolution", "y_resolution", "planar_configuration", "page_name", "x_position", "y_position", "free_offsets", "free_byte_counts", "gray_response_unit", "gray_response_curve", "t4_options", "t6_options", "resolution_unit", "transfer_function", "software", "date_time", "artist", "host_computer", "predictor", "white_point", "primary_chromaticities", "color_map", "halftone_hints", "tile_width", "tile_length", "tile_offsets", "tile_byte_counts", "sub_ifds", "ink_set", "ink_names", "number_of_inks", "dot_range", "target_printer", "extra_samples", "transfer_range", "clip_path", "x_clip_path_units", "y_clip_path_units", "indexed", "jpeg_tables", "opi_proxy", "global_parameters_ifd", "profile_type", "fax_profile", "coding_methods", "version_year", "mode_number", "decode", "default_image_color", "jpegproc", "jpeg_interchange_format", "jpeg_interchange_format_length", "jpeg_restart_interval", "jpeg_lossless_predictors", "jpeg_point_transforms", "jpeg_q_tables", "jpeg_dc_tables", "jpeg_ac_tables", "ycb_cr_coefficients", "ycb_cr_sub_sampling", "ycb_cr_positioning", "reference_black_white", "strip_row_counts", "xmp", "image_id", "image_layer", "copyright", "iptc", "exposure_time", "f_number", "exposure_program", "spectral_sensitivity", "iso_speed_ratings", "oecf", "exif_version", "date_time_original", "date_time_digitized", "components_configuration", "compressed_bits_per_pixel", "shutter_speed_value", "aperture_value", "brightness_value", "exposure_bias_value", "max_aperture_value", "subject_distance", "metering_mode", "light_source", "flash", "focal_length", "subject_area", "maker_note", "user_comment", "subsec_time", "subsec_time_orginal", "subsec_time_digitized", "flashpix_version", "color_space", "pixel_x_dimension", "pixel_y_dimension", "related_sound_file", "flash_energy", "spatial_frequency_response", "focal_plane_x_resolution", "focal_plane_y_resolution", "focal_plane_resolution_unit", "subject_location", "exposure_index", "sensing_method", "file_source", "scene_type", "cfa_pattern", "custom_rendered", "exposure_mode", "white_balance", "digital_zoom_ratio", "focal_length_in_35mm_film", "scene_capture_type", "gain_control", "contrast", "saturation", "sharpness", "device_setting_description", "subject_distance_range", "image_unique_id", "gps_version_id", "gps_latitude_ref", "gps_latitude", "gps_longitude_ref", "gps_longitude", "gps_altitude_ref", "gps_altitude", "gps_time_stamp", "gps_satellites", "gps_status", "gps_measure_mode", "gps_dop", "gps_speed_ref", "gps_speed", "gps_track_ref", "gps_track", "gps_img_direction_ref", "gps_img_direction", "gps_map_datum", "gps_dest_latitude_ref", "gps_dest_latitude", "gps_dest_longitude_ref", "gps_dest_longitude", "gps_dest_bearing_ref", "gps_dest_bearing", "gps_dest_distance_ref", "gps_dest_distance", "gps_processing_method", "gps_area_information", "gps_date_stamp", "gps_differential", "gps"]

  def initialize(exifr)
    
    attrib_hash = {}
      @@array.each do |x|
      attrib_hash[x.to_sym] = exifr.send(x.to_sym)
    end
    
    count = 0
    attrib_hash.each do |key, value|
      unless key == "exif"
        if value.class == String
          instance_variable_set("@#{key}", value) 
        elsif value.class ==  Array 
          instance_variable_set("@#{key}", value.join(','))
        elsif value.class ==  Fixnum 
          instance_variable_set("@#{key}", value.to_s)
        elsif value.class ==  Float 
          instance_variable_set("@#{key}", value.to_s)
        elsif value.class ==  Integer 
          instance_variable_set("@#{key}", value.to_s)
        elsif value.class ==  Time 
          instance_variable_set("@#{key}", value.to_s)
        elsif value.class ==  Rational 
          instance_variable_set("@#{key}", value.to_s)
        elsif value.class ==  EXIFR::TIFF::Degrees
          instance_variable_set("@#{key}", value.to_s)
        elsif value.class ==  EXIFR::TIFF::Orientation
          instance_variable_set("@#{key}", value.to_s)          
        elsif value.class == EXIFR::TIFF
          instance_variable_set("@#{key}", value.to_s)          
        elsif value.class == EXIFR::TIFF::GPS
          instance_variable_set("@#{key}", value.to_s)          
        elsif value.class == NilClass
          instance_variable_set("@#{key}", nil)
        end
      end
    end
  end
end



Dir.foreach('app/assets/images') do |photo|
    # photo = "photo"

  unless photo[-4..-1] != ".JPG" && photo[-4..-1] != ".jpg"
  image_in_question = EXIFR::JPEG.new("app/assets/images/photo.jpg")
  classed_image = Image.new(image_in_question)


  Picture.create(
    latitude: image_in_question.gps.latitude, 
    longitude: image_in_question.gps.longitude, 
    # orientation: image_in_question.orientation,
    date_time_original: image_in_question.date_time_original,
    date_time: image_in_question.date_time,
    gps_date_stamp: image_in_question.gps_date_stamp)
  end
end