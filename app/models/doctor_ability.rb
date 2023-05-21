# frozen_string_literal: true

class DoctorAbility
  include CanCan::Ability

  def initialize(doctor)
    can :manage, Doctor, id: doctor.id
  end
end
