class AddTypeOfHelpRefToHelp < ActiveRecord::Migration[5.1]
  def change
    add_reference :helps, :type_of_help, foreign_key: true
  end
end
