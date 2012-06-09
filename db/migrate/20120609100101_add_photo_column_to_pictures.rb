class AddPhotoColumnToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :pictures, :photo
  end
end
