class Admin::CitiesController < AdminController
  before_action :find_city, only: [:show, :edit, :update, :destroy]
  before_action :districts, only: [:new, :create, :edit, :update]

  add_breadcrumb I18n.t("admin_breadcrumbs.cities"), :admin_cities_path

  def index
    @cities = City.paginate(page: params[:page], per_page: 10).order(name: :desc)
    @total_cities = City.all.size
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_city"), :admin_city_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_city"), :new_admin_city_path

    @city = City.new
  end

  def create
    @city = City.new(city_params)

    if @city.save
      flash[:success] = I18n.t("cities.create.success")
      redirect_to admin_cities_path
    else
      flash[:error] = I18n.t("cities.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_city"), :edit_admin_city_path
  end

  def update
    if @city.update(city_params)
      flash[:success] = I18n.t("cities.update.success")
      redirect_to admin_cities_path
    else
      flash[:error] = I18n.t("cities.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @city.destroy

    flash[:success] = I18n.t("cities.destroy.success")
    redirect_to admin_cities_path
  end

  private

  def city_params
    params.require(:city).permit(:name, :status, :realty_ids => [], :district_ids => [])
  end

  def find_city
    @city = City.find(params[:id])
  end

  def districts
    @districts = @city.present? ? District.where(city_id: @city.id).sort : District.all
  end
end
