class AddAvatarToBenefited < ActiveRecord::Migration[5.1]
  def change
    add_column :benefiteds, :avatar, :string
  end
end
