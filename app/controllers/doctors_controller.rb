# frozen_string_literal: true

class DoctorsController < ResourcesController
  before_action :authenticate_doctor!

  def current_ability
    @current_ability ||= DoctorAbility.new(current_doctor)
  end

  def show; end

  def edit; end

  def update
    if @record.update(user_params.merge(registration_finished: true))
      redirect_to root_path, notice: 'Your account has been updated.'
    else
      render :edit, alert: "There was an error updating your account: #{@record.errors.full_messages.join('; ')}"
    end
  end

  private

  def user_params
    params.require(:doctor).permit(:first_name, :last_name, :phone_number)
  end
end
