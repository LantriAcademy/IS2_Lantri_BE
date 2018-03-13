class AddPicturesRefToContributor < ActiveRecord::Migration[5.1]
  def change
    add_reference :contributors, :pictures, foreign_key: true
  end
end
