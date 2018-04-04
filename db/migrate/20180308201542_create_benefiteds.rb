class CreateBenefiteds < ActiveRecord::Migration[5.1]
  def change
    create_table :benefiteds do |t|
      t.integer :age
      t.string :preferences
      t.string :name

      t.timestamps
    end
  end
end
