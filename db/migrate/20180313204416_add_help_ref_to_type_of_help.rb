class AddHelpRefToTypeOfHelp < ActiveRecord::Migration[5.1]
  def change
    add_reference :type_of_helps, :help, foreign_key: true
  end
end
