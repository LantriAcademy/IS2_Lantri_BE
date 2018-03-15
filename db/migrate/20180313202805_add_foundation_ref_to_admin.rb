class AddFoundationRefToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_reference :admins, :foundation, foreign_key: true
  end
end
