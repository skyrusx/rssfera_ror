class AdminController < ActionController::Base
  before_action :authenticate_admin!
  layout "admin"
  add_breadcrumb "Dashboard", :admin_path

  def index
    add_breadcrumb "Dashboard", :admin_path
  end

  def current_admin
    return unless session["warden.user.admin.key"][0][0]
    @current_admin ||= Admin.find(session["warden.user.admin.key"][0][0])
  end

  def contact_page
    @contact = Contact.last
  end
end
