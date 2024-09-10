class Admin::EmploymentTypesController < AdminController
  before_action :find_employment_type, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t("admin_breadcrumbs.employment_types"), :admin_employment_types_path

  def index
    @employment_types = EmploymentType.paginate(page: params[:page], per_page: 10)
    @total_employment_types = EmploymentType.all.size
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_employment_type"), :admin_employment_type_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_employment_type"), :new_admin_employment_type_path

    @employment_type = EmploymentType.new
  end

  def create
    @employment_type = EmploymentType.new(employment_type_params)

    if @employment_type.save
      flash[:success] = I18n.t("employment_types.create.success")
      redirect_to admin_employment_types_path
    else
      flash[:error] = I18n.t("employment_types.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_employment_type"), :edit_admin_employment_type_path
  end

  def update
    if @employment_type.update(employment_type_params)
      flash[:success] = I18n.t("employment_types.update.success")
      redirect_to admin_employment_types_path
    else
      flash[:error] = I18n.t("employment_types.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employment_type.destroy

    flash[:success] = I18n.t("employment_types.destroy.success")
    redirect_to admin_employment_types_path
  end

  private

  def employment_type_params
    params.require(:employment_type).permit(:name, :status, :vacancy_ids => [])
  end

  def find_employment_type
    @employment_type = EmploymentType.find(params[:id])
  end
end
