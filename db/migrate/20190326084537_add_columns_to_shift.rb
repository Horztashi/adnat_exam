class AddColumnsToShift < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :shift_date, :date
    add_column :shifts, :start, :time
    add_column :shifts, :finish, :time
    add_column :shifts, :break, :decimal
  end
end
