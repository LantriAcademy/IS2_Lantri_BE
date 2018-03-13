class AddContributorsRefToInterest < ActiveRecord::Migration[5.1]
  def change
    add_reference :interests, :contributor, foreign_key: true
  end
end
