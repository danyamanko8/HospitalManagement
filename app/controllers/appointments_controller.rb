# frozen_string_literal: true

class AppointmentsController < ResourcesController
  before_action :set_records, only: %i[new create]
  skip_before_action :set_record, only: %i[new create]

  def current_ability
    @current_ability ||= AppointmentAbility.new(current_doctor.presence || current_user)
  end

  def new; end

  def create
    @record = current_user.appointments.new(appointment_params.except(:recommendation))

    if @record.save
      redirect_to root_path, notice: 'Your appointment has been created.'
    else
      redirect_to new_appointment_path(doctor_id: @doctor.id), alert: @record.errors.full_messages.join('; ')
    end
  end

  def show; end

  def add_recommendation
    authorize! :add_recommendation, @record
  end

  def attach_recommendation
    authorize! :add_recommendation, @record

    if @record.update(appointment_params.slice(:recommendation))
      @record.closed!
      redirect_to root_path, notice: 'Your recommendation has been added.'
    else
      redirect_to add_recommendation_appointment_path(@record), alert: @record.errors.full_messages.join('; ')
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :doctor_id, :user_id, :recommendation)
  end

  def set_records
    @doctor = Doctor.find_by_id(params[:doctor_id].presence || appointment_params[:doctor_id])
    @record = current_user.appointments.new(doctor_id: @doctor.id)
  end
end
