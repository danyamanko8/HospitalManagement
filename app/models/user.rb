# frozen_string_literal: true

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  store_accessor :address, %i[city street house_number]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { not_defined: 0, male: 10, female: 20 }

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  validates :phone_number, presence: true, length: { minimum: 10, maximum: 15 }, uniqueness: true, format: { with: /\A[0-9]+\z/, message: "only allows numbers" }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :date_of_birth, presence: true, format: { with: /\d{4}-\d{2}-\d{2}/, message: "only allows format YYYY-MM-DD" }

  # def email_required?
  #   false
  # end
  #
  # def email_changed?
  #   false
  # end
end
