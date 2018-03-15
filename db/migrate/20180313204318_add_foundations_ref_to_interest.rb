class AddFoundationsRefToInterest < ActiveRecord::Migration[5.1]
  def change
    add_reference :interests, :foundation, foreign_key: true
  end
end
