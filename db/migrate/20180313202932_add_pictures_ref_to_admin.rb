class AddPicturesRefToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_reference :admins, :picture, foreign_key: true
  end
end
