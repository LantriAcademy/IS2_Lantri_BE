class AddInterestsRefToContributor < ActiveRecord::Migration[5.1]
  def change
    add_reference :contributors, :interest, foreign_key: true
  end
end
