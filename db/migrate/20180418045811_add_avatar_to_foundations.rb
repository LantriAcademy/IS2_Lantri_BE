class AddAvatarToFoundations < ActiveRecord::Migration[5.1]
  def change
    add_column :foundations, :avatar, :string
  end
end
