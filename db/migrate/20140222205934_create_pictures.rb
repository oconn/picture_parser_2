class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :path
      t.integer :user_id
      t.float :latitude
      t.float :longitude
      t.text :date_time_original
      t.text :date_time
      t.text :gps_date_stamp
      t.timestamps
    end
  end
end