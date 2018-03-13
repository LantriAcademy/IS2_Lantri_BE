class AddHelpsRefToBenefited < ActiveRecord::Migration[5.1]
  def change
    add_reference :benefiteds, :help, foreign_key: true
  end
end
