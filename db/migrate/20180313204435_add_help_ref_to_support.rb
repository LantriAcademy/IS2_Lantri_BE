class AddHelpRefToSupport < ActiveRecord::Migration[5.1]
  def change
    add_reference :supports, :help, foreign_key: true
  end
end
