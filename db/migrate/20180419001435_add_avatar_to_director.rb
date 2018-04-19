class AddAvatarToDirector < ActiveRecord::Migration[5.1]
  def change
    add_column :directors, :avatar, :string
  end
end
