class Admin::RegionsController < AdminController
  before_action :find_region, only: [:show, :edit, :update, :destroy]
  before_action :cities, :countries, only: [:new, :create, :edit, :update]

  add_breadcrumb I18n.t("admin_breadcrumbs.regions"), :admin_regions_path

  def index
    @regions = Region.paginate(page: params[:page], per_page: 20).order(:created_at)
    @total_regions = Region.all.size
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_region"), :admin_region_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_region"), :new_admin_region_path

    @region = Region.new
  end

  def create
    @region = Region.new(region_params)

    if @region.save
      flash[:success] = I18n.t("regions.create.success")
      redirect_to admin_regions_path
    else
      flash[:error] = I18n.t("regions.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_region"), :edit_admin_region_path
  end

  def update
    if @region.update(region_params)
      flash[:success] = I18n.t("regions.update.success")
      redirect_to admin_regions_path
    else
      flash[:error] = I18n.t("regions.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @region.destroy

    flash[:success] = I18n.t("regions.destroy.success")
    redirect_to admin_regions_path
  end

  private

  def region_params
    params.require(:region).permit(:name, :localized_name, :localized_name_short, :full_name, :country_id, :city_ids => [])
  end

  def find_region
    @region = Region.find(params[:id])
  end

  def cities
    @cities = @region.present? ? City.where(region_id: @region.id).sort : City.all
  end

  def countries
    @countries = @region.present? ? Country.where(id: @region.country_id) : Country.all
  end
end
