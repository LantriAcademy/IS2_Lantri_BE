class AddPicturesRefToBenefited < ActiveRecord::Migration[5.1]
  def change
    add_reference :benefiteds, :picture, foreign_key: true
  end
end
