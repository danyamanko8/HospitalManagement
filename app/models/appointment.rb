# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  enum status: { active: 0, closed: 10 }

  validates_presence_of :user_id, :doctor_id
  validates :start_time, presence: true, uniqueness: { scope: :doctor_id }, inclusion: { in: (Time.now..Time.now + 1.year) }
  validates_presence_of :recommendation, on: :update
end
