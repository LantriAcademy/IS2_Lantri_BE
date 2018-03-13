class AddContributorRefToHelp < ActiveRecord::Migration[5.1]
  def change
    add_reference :helps, :contributor, foreign_key: true
  end
end
