# frozen_string_literal: true

class AppointmentAbility
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Doctor)
      can :add_recommendation, Appointment, doctor_id: user.id
    elsif user.is_a?(User)
      can :manage, Appointment, user_id: user.id
    else
      cannot :manage, Appointment
    end
  end
end
