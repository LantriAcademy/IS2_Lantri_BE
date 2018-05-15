class AddPdfToFoundations < ActiveRecord::Migration[5.1]
  def change
    add_column :foundations, :pdf, :string
  end
end
