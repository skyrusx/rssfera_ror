class Admin::SocialLinksController < AdminController
  before_action :find_social_link, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t("admin_breadcrumbs.social_links"), :admin_social_links_path

  def index
    @social_links = SocialLink.all
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_social_link"), :admin_social_link_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_social_link"), :new_admin_social_link_path

    @social_link = SocialLink.new
  end

  def create
    @social_link = SocialLink.new(social_link_params)

    if @social_link.save
      flash[:success] = I18n.t("social_links.create.success")
      redirect_to admin_social_links_path
    else
      flash[:error] = I18n.t("social_links.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_social_link"), :edit_admin_social_link_path
  end

  def update
    if @social_link.update(social_link_params)
      flash[:success] = I18n.t("social_links.update.success")
      redirect_to admin_social_links_path
    else
      flash[:error] = I18n.t("social_links.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @social_link.destroy

    flash[:success] = I18n.t("social_links.destroy.success")
    redirect_to admin_social_links_path
  end

  private

  def social_link_params
    params.require(:social_link).permit(:name, :status, :link)
  end

  def find_social_link
    @social_link = SocialLink.find(params[:id])
  end
end
