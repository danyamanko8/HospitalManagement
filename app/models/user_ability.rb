# frozen_string_literal: true

class UserAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, User, id: user.id
  end
end
