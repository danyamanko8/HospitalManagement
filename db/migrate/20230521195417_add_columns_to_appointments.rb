class AddColumnsToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :start_time, :datetime
    add_column :appointments, :recommendation, :text
    add_column :appointments, :status, :integer, default: 0
  end
end
