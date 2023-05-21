# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :check_authenticate, only: [:index]
  def index; end

  private

  def check_authenticate
    if current_user
      redirect_to user_path(current_user) and nil
    elsif current_doctor
      redirect_to doctor_path(current_doctor) and nil
    else
      render :index and nil
    end
  end
end
