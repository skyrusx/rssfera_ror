class ApplicationController < ActionController::Base
  layout :layout
  add_breadcrumb "Главная", :root_path

  private

  def layout
    devise_controller? && devise_mapping.name == :admin ? "admin" : "application"
  end
end
