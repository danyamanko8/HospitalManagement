# frozen_string_literal: true

class AddCategoryReferenceToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_reference :doctors, :category, null: true, foreign_key: true, index: true
  end
end
