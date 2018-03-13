class AddHelpRefToStatusOfHelp < ActiveRecord::Migration[5.1]
  def change
    add_reference :status_of_helps, :help, foreign_key: true
  end
end
