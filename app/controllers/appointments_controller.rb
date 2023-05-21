# frozen_string_literal: true

class AppointmentsController < ResourcesController
  before_action :check_authenticate
  skip_before_action :set_record, only: [:new, :create]

  def current_ability
    @current_ability ||= AppointmentAbility.new(current_doctor.presence || current_user)
  end

  def new
    @record = current_user.appointments.new
  end

  def create
    @record = current_user.appointments.new(appointment_params)

    if @record.save
      redirect_to root_path, notice: 'Your appointment has been created.'
    else
      render :new, alert: @record.errors.full_messages.join('; ')
    end
  end

  def edit; end

  def update
    if @record.update(appointment_params)
      redirect_to root_path, notice: 'Your account has been updated.'
    else
      render :edit, alert: "There was an error updating your account: #{@record.errors.full_messages.join('; ')}"
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :doctor_id, :user_id)
  end

  def check_authenticate
    return if current_doctor || current_user

    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end
end
