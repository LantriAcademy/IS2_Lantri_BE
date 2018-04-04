class AddFoundationRefToDirector < ActiveRecord::Migration[5.1]
  def change
    add_reference :directors, :foundation, foreign_key: true
  end
end
