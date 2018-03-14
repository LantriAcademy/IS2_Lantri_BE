class AddPicturesRefToSupport < ActiveRecord::Migration[5.1]
  def change
    add_reference :supports, :picture, foreign_key: true
  end
end
