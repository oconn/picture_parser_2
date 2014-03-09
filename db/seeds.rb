require 'exifr'

Dir.foreach('app/assets/images') do |photo|

  unless photo[-4..-1] != ".JPG" && photo[-4..-1] != ".jpg"
    image_in_question = EXIFR::JPEG.new("app/assets/images/#{photo}")

    if image_in_question.gps == nil
      Picture.create(
        latitude: "42.05322",  # THIS IS WHERE ALEX LIVES....FUCKING ROMANIAN CRAZY MAN 
        longitude: "-87.84644",
        path: "app/assets/images/#{photo}",
        date_time_original: image_in_question.date_time_original,
        date_time: image_in_question.date_time)
    else
      Picture.create(
        path: "app/assets/images/#{photo}",
        latitude: image_in_question.gps.latitude, 
        longitude: image_in_question.gps.longitude, 
        date_time_original: image_in_question.date_time_original,
        date_time: image_in_question.date_time,
        gps_date_stamp: image_in_question.gps_date_stamp)
    end
  end
end