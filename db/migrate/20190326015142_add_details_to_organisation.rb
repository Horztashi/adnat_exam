class AddDetailsToOrganisation < ActiveRecord::Migration[5.1]
  def change
    add_column :organisations, :name, :string
    add_column :organisations, :hour_rate, :decimal
  end
end
