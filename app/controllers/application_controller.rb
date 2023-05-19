# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_record, unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_back(fallback_location: root_path, alert: exception.message)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  private

  def set_record
    @record = controller_name.classify.constantize.find_by(id: params[:id]) if params[:id]
    redirect_back(fallback_location: root_path, alert: "#{controller_name.classify} not found.") unless @record
  end
end
