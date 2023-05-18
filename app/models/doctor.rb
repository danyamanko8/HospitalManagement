# frozen_string_literal: true

class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :category, optional: true
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  # validates_presence_of :first_name, :last_name, :bio
  validates :phone_number, presence: true, length: { minimum: 10, maximum: 15 }, uniqueness: true
  validate :appointments_count

  def appointments_count
    errors.add(:base, "You can't have more than 10 appointments") if appointments.size > 10
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
