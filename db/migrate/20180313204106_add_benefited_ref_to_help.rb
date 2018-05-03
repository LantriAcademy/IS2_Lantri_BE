class AddBenefitedRefToHelp < ActiveRecord::Migration[5.1]
  def change
    add_reference :helps, :benefited, foreign_key: true
  end
end
