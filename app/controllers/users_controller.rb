# frozen_string_literal: true

class UsersController < ResourcesController
  before_action :authenticate_user!
  load_and_authorize_resource

  def current_ability
    @current_ability ||= UserAbility.new(current_user)
  end

  def show; end

  def edit; end

  def update
    if @record.update(user_params)
      redirect_to root_path, notice: 'Your account was successfully updated.'
    else
      render :edit, alert: "There was an error updating your account: #{@record.errors.full_messages.join('; ')}"
    end
  end

  def appointments
    @appointments = current_user.appointments
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email,
                                 :password, :city, :house_number, :street,
                                 :gender, :date_of_birth, :avatar, :gender)
  end
end
