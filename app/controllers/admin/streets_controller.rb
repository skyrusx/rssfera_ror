class Admin::StreetsController < AdminController
  before_action :find_street, only: [:show, :edit, :update, :destroy]
  before_action :districts, only: [:new, :create, :edit, :update]

  add_breadcrumb I18n.t("admin_breadcrumbs.streets"), :admin_streets_path

  def index
    @streets = Street.paginate(page: params[:page], per_page: 50).order(:district_id, name: :desc)
    @total_streets = Street.all.size
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_street"), :admin_street_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_street"), :new_admin_street_path

    @street = Street.new
  end

  def create
    @street = Street.new(street_params)

    if @street.save
      flash[:success] = I18n.t("streets.create.success")
      redirect_to admin_streets_path
    else
      flash[:error] = I18n.t("streets.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_street"), :edit_admin_street_path
  end

  def update
    if @street.update(street_params)
      flash[:success] = I18n.t("streets.update.success")
      redirect_to admin_streets_path
    else
      flash[:error] = I18n.t("streets.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @street.destroy

    flash[:success] = I18n.t("streets.destroy.success")
    redirect_to admin_streets_path
  end

  private

  def street_params
    params.require(:street).permit(:name, :district_id, :realty_ids => [])
  end

  def find_street
    @street = Street.find(params[:id])
  end

  def districts
    @districts = District.all.sort
  end

  def streets
    @streets = @district.present? ? Street.where(district_id: @district.id).sort : Street.all
  end
end
