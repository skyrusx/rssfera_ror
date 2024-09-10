class Admin::JobTitlesController < AdminController
  before_action :find_job_title, only: [:show, :edit, :update, :destroy]
  before_action :team_members, only: [:new, :create, :edit, :update]
  before_action :job_titles, only: [:index, :new, :create, :edit, :update]

  add_breadcrumb I18n.t("admin_breadcrumbs.job_titles"), :admin_job_titles_path

  def index
    @job_titles = JobTitle.paginate(page: params[:page], per_page: 10).order(:position)
    @total_job_titles = JobTitle.all.size
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_job_title"), :admin_job_title_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_job_title"), :new_admin_job_title_path

    @job_title = JobTitle.new
  end

  def create
    @job_title = JobTitle.new(job_title_params)

    if @job_title.save
      flash[:success] = I18n.t("job_titles.create.success")
      redirect_to admin_job_titles_path
    else
      flash[:error] = I18n.t("job_titles.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_job_title"), :edit_admin_job_title_path
  end

  def update
    if @job_title.update(job_title_params)
      flash[:success] = I18n.t("job_titles.update.success")
      redirect_to admin_job_titles_path
    else
      flash[:error] = I18n.t("job_titles.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job_title.destroy

    flash[:success] = I18n.t("job_titles.destroy.success")
    redirect_to admin_job_titles_path
  end

  private

  def job_title_params
    params.require(:job_title).permit(:name, :status, :position, :team_member_ids => [], :vacancy_ids => [])
  end

  def find_job_title
    @job_title = JobTitle.find(params[:id])
  end

  def team_members
    @team_members = TeamMember.active
  end

  def job_titles
    @job_titles = JobTitle.order(:position)
  end
end
