class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|

      t.timestamps
    end
  end
end
