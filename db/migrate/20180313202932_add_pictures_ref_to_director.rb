class AddPicturesRefToDirector < ActiveRecord::Migration[5.1]
  def change
    add_reference :directors, :picture, foreign_key: true
  end
end
