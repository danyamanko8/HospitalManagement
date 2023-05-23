# frozen_string_literal: true

class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :category, optional: true
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  validates :phone_number, presence: true, length: { minimum: 10, maximum: 15 }, uniqueness: true,
                           format: { with: /\A[0-9]+\z/, message: 'only allows numbers' }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 20 }, on: :update
  validates :last_name, presence: true, length: { minimum: 2, maximum: 20 }, on: :update
  validate :appointments_count, on: :update

  scope :by_category, ->(category_id) { where(category_id: category_id) }

  def appointments_count
    errors.add(:base, "You can't have more than 10 appointments") if appointments.count > 10
  end

  def appointments_limit_reached?
    appointments.count >= 10
  end

  def full_name_with_category
    "#{full_name} (#{category&.public_label})"
  end

  def full_name
    "#{first_name&.capitalize} #{last_name&.capitalize}"
  end
end
