class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :organisation, foreign_key: true
  end
end
