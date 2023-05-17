# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  validates :phone_number, presence: true, length: { minimum: 10, maximum: 15 }, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end