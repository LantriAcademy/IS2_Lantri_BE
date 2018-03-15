class AddStatusOfHelpRefToHelp < ActiveRecord::Migration[5.1]
  def change
    add_reference :helps, :status_of_help, foreign_key: true
  end
end
