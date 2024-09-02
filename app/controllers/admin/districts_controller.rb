class Admin::DistrictsController < AdminController
  before_action :find_district, only: [:show, :edit, :update, :destroy]
  before_action :find_city, :cities, :streets, only: [:new, :create, :edit, :update]

  add_breadcrumb I18n.t("admin_breadcrumbs.districts"), :admin_districts_path

  def index
    @districts = District.all.sort
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_district"), :admin_district_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_district"), :new_admin_district_path

    @district = District.new
  end

  def create
    @district = District.new(district_params)

    if @district.save
      flash[:success] = I18n.t("districts.create.success")
      redirect_to admin_districts_path
    else
      flash[:error] = I18n.t("districts.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_district"), :edit_admin_district_path
  end

  def update
    if @district.update(district_params)
      flash[:success] = I18n.t("districts.update.success")
      redirect_to admin_districts_path
    else
      flash[:error] = I18n.t("districts.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @district.destroy

    flash[:success] = I18n.t("districts.destroy.success")
    redirect_to admin_districts_path
  end

  private

  def district_params
    params.require(:district).permit(:name, :city_id, :realty_ids => [])
  end

  def find_district
    @district = District.find(params[:id])
  end

  def find_city
    @city = City.find_by(id: @district.city_id) if @district.present?
  end

  def cities
    @cities = City.active.sort
  end

  def streets
    @streets = @district.present? ? Street.where(district_id: @district.id).sort : Street.all
  end
end
