class ApplicationController < ActionController::Base
  layout :layout

  private

  def layout
    devise_controller? && devise_mapping.name == :admin ? "admin" : "application"
  end
end
