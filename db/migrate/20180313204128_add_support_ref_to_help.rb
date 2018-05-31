class AddSupportRefToHelp < ActiveRecord::Migration[5.1]
  def change
    add_reference :helps, :support, foreign_key: true
  end
end
