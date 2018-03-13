class AddPicturesRefToFoundation < ActiveRecord::Migration[5.1]
  def change
    add_reference :foundations, :picture, foreign_key: true
  end
end
