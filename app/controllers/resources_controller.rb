# frozen_string_literal: true

class ResourcesController < ApplicationController
  before_action :set_record

  rescue_from CanCan::AccessDenied do |exception|
    redirect_back(fallback_location: root_path, alert: exception.message)
  end

  private

  def set_record
    @record = controller_name.classify.constantize.find_by(id: params[:id]) if params[:id]
    redirect_back(fallback_location: root_path, alert: "#{controller_name.classify} not found.") unless @record
  end
end
