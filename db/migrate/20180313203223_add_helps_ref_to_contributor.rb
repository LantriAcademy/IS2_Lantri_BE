class AddHelpsRefToContributor < ActiveRecord::Migration[5.1]
  def change
    add_reference :contributors, :help, foreign_key: true
  end
end
