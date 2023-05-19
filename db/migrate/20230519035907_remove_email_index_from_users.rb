# frozen_string_literal: true

class RemoveEmailIndexFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :email
    add_column :users, :email, :string, null: true
  end
end
