class Admin::SettingsController < AdminController
  before_action :find_setting, only: [:show, :edit, :update]

  add_breadcrumb I18n.t("admin_breadcrumbs.settings"), :admin_settings_path

  def index
    @settings = Setting.all
  end

  def show
    add_breadcrumb @setting.page_name, :admin_setting_path
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_setting"), :edit_admin_setting_path
  end

  def update
    if @setting.update(setting_params)
      flash[:success] = I18n.t("settings.update.success")
      redirect_to admin_settings_path
    else
      flash[:error] = I18n.t("settings.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:page, :page_name, :meta_title, :meta_keywords, :meta_description)
  end

  def find_setting
    @setting = Setting.find(params[:id])
  end
end
