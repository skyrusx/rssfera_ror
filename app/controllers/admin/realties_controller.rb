class Admin::RealtiesController < AdminController
  before_action :find_realty, only: [:show, :edit, :update, :destroy, :delete_photo]
  before_action :cities, :districts, :streets, :categories, :team_members, :specifications, only: [:new, :create, :edit, :update]

  add_breadcrumb I18n.t("admin_breadcrumbs.realties"), :admin_realties_path

  def index
    @realties = Realty.all.sort_by{ |realty| realty.realty_category.name }.reverse
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_realty"), :admin_realty_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_realty"), :new_admin_realty_path

    @realty = Realty.new
  end

  def create
    @realty = Realty.new(realty_params)
    @realty.specifications = params[:specs]

    if @realty.save
      flash[:success] = I18n.t("realties.create.success")
      redirect_to admin_realties_path
    else
      flash[:error] = I18n.t("realties.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_realty"), :edit_admin_realty_path
  end

  def update
    if @realty.update(realty_params)
      @realty.specifications = params[:specs]
      @realty.save
      flash[:success] = I18n.t("realties.update.success")
      redirect_to admin_realties_path
    else
      flash[:error] = I18n.t("realties.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @realty.destroy

    flash[:success] = I18n.t("realties.destroy.success")
    redirect_to admin_realties_path
  end

  def delete_photo
    @photo = ActiveStorage::Attachment.find(params[:photo_id])
    if @photo.purge
      flash[:success] = I18n.t("teams.delete_photo.success")
    else
      flash[:error] = I18n.t("teams.delete_photo.error")
    end
    redirect_to edit_admin_realty_path(id: @realty.id)
  end

  private

  def realty_params
    params.require(:realty).permit(
      :name, :status, :slug, :location, :price, :payments, :description, :type_object, :team_member_id,
      :realty_category_id, :city_id, :ditrict_id, :street_id, :photos => [], :specifications => '{}'
    )
  end

  def find_realty
    @realty = Realty.find(params[:id])
  end

  def cities
    @cities = City.active
  end

  def districts
    @districts = @realty.present? ? District.where(city_id: @realty.city_id).sort : District.all
  end

  def streets
    @streets = @realty.present? ? Street.where(district_id: @realty.district_id).sort : Street.all
  end

  def categories
    @categories = RealtyCategory.active
  end

  def team_members
    @team_members = TeamMember.active
  end

  def specifications
    @specifications = @realty.present? ? @realty.specifications : Realty::SPECIFICATIONS
  end
end
