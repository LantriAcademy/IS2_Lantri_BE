class AddInterestsRefToFoundation < ActiveRecord::Migration[5.1]
  def change
    add_reference :foundations, :interest, foreign_key: true
  end
end
