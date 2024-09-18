class Admin::CountriesController < AdminController
  before_action :find_country, only: [:show, :edit, :update, :destroy]
  before_action :regions, only: [:new, :create, :edit, :update]

  add_breadcrumb I18n.t("admin_breadcrumbs.countries"), :admin_countries_path

  def index
    @countries = Country.paginate(page: params[:page], per_page: 10).order(name: :desc)
    @total_countries = Country.all.size
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_country"), :admin_country_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_country"), :new_admin_country_path

    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      flash[:success] = I18n.t("countries.create.success")
      redirect_to admin_countries_path
    else
      flash[:error] = I18n.t("countries.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_country"), :edit_admin_country_path
  end

  def update
    if @country.update(country_params)
      flash[:success] = I18n.t("countries.update.success")
      redirect_to admin_countries_path
    else
      flash[:error] = I18n.t("countries.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @country.destroy

    flash[:success] = I18n.t("countries.destroy.success")
    redirect_to admin_countries_path
  end

  private

  def country_params
    params.require(:country).permit(:name, :localized_name, :currency_code, :currency_symbol, :region_ids => [])
  end

  def find_country
    @country = Country.find(params[:id])
  end

  def regions
    @regions = @country.present? ? Region.where(country_id: @country.id).sort : Region.all
  end
end
