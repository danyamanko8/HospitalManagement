# frozen_string_literal: true

class DoctorsController < ResourcesController
  before_action :authenticate_doctor!
  load_and_authorize_resource

  def current_ability
    @current_ability ||= DoctorAbility.new(current_doctor)
  end

  def show; end

  def edit; end

  def update
    if @record.update(doctor_params)
      redirect_to root_path, notice: 'Your account has been updated.'
    else
      render :edit, alert: "There was an error updating your account: #{@record.errors.full_messages.join('; ')}"
    end
  end

  def appointments
    @appointments = current_doctor.appointments
  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :phone_number,
                                   :email, :bio, :category_id)
  end
end
