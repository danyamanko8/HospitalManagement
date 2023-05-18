# frozen_string_literal: true

class AddPhoneNumberToAdminUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :phone_number, :string, null: false, default: ''
  end
end
