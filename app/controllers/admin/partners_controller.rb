class Admin::PartnersController < AdminController
  before_action :find_partner, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t("admin_breadcrumbs.partners"), :admin_partners_path

  def index
    @partners = Partner.all
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_partner"), :admin_partner_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_partner"), :new_admin_partner_path

    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)

    if @partner.save
      flash[:success] = I18n.t("partners.create.success")
      redirect_to admin_partners_path
    else
      flash[:error] = I18n.t("partners.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_partner"), :edit_admin_partner_path
  end

  def update
    if @partner.update(partner_params)
      flash[:success] = I18n.t("partners.update.success")
      redirect_to admin_partners_path
    else
      flash[:error] = I18n.t("partners.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @partner.destroy

    flash[:success] = I18n.t("partners.destroy.success")
    redirect_to admin_partners_path
  end

  def delete_logo
    @logo = ActiveStorage::Attachment.find(params[:logo_id])
    if @logo.purge
      flash[:success] = I18n.t("partners.delete_logo.success")
    else
      flash[:error] = I18n.t("partners.delete_logo.error")
    end
    redirect_to edit_admin_partner_path(id: @partner.id)
  end

  private

  def partner_params
    params.require(:partner).permit(:name, :status, :anchor, :description, :logo)
  end

  def find_partner
    @partner = Partner.find(params[:id])
  end
end
