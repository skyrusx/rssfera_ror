class Admin::RealtyCategoriesController < AdminController
  before_action :find_realty_category, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t("admin_breadcrumbs.realty_categories"), :admin_realty_categories_path

  def index
    @realty_categories = RealtyCategory.paginate(page: params[:page], per_page: 10).order(:name)
    @total_realty_categories = RealtyCategory.all.size
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_realty_category"), :admin_realty_category_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_realty_category"), :new_admin_realty_category_path

    @realty_category = RealtyCategory.new
  end

  def create
    @realty_category = RealtyCategory.new(realty_category_params)

    if @realty_category.save
      flash[:success] = I18n.t("realty_categories.create.success")
      redirect_to admin_realty_categories_path
    else
      flash[:error] = I18n.t("realty_categories.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_realty_category"), :edit_admin_realty_category_path
  end

  def update
    if @realty_category.update(realty_category_params)
      flash[:success] = I18n.t("realty_categories.update.success")
      redirect_to admin_realty_categories_path
    else
      flash[:error] = I18n.t("realty_categories.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @realty_category.destroy

    flash[:success] = I18n.t("realty_categories.destroy.success")
    redirect_to admin_realty_categories_path
  end

  private

  def realty_category_params
    params.require(:realty_category).permit(:name, :status)
  end

  def find_realty_category
    @realty_category = RealtyCategory.find(params[:id])
  end
end
