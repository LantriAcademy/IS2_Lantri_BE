class AddImageableRefToPictures < ActiveRecord::Migration[5.1]
  def change
    add_index :pictures, [:imageable_type, :imageable_id]
  end
end
