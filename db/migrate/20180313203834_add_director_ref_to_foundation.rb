class AddDirectorRefToFoundation < ActiveRecord::Migration[5.1]
  def change
    add_reference :foundations, :director, foreign_key: true
  end
end
