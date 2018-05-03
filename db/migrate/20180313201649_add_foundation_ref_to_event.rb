class AddFoundationRefToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :foundation, foreign_key: true
  end
end
