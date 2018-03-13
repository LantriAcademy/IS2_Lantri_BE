class AddBenefitedsRefToFoundation < ActiveRecord::Migration[5.1]
  def change
    add_reference :foundations, :benefited, foreign_key: true
  end
end
