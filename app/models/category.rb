# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :doctors, dependent: :nullify
  validates :public_label, presence: true, uniqueness: true
end
