# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :check_authenticate, only: [:index]
  before_action :authenticate_user!, only: [:doctors]
  def index; end

  def doctors
    @doctors = Doctor.all
    return unless params.dig('/doctors', :category_id).present?

    @doctors = Doctor.by_category(params.dig('/doctors', :category_id))
  end

  private

  def check_authenticate
    if current_user
      redirect_to doctors_path and nil
    elsif current_doctor
      redirect_to appointments_doctor_path(current_doctor) and nil
    else
      render :index and nil
    end
  end
end
