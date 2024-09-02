class Admin::VacanciesController < AdminController
  before_action :find_vacancy, only: [:show, :edit, :update, :destroy]
  before_action :employment_types, :job_titles, :skills, :team_members, only: [:new, :create, :edit, :update]

  add_breadcrumb I18n.t("admin_breadcrumbs.vacancies"), :admin_vacancies_path

  def index
    @vacancies = Vacancy.all
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_vacancy"), :admin_vacancy_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_vacancy"), :new_admin_vacancy_path

    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      flash[:success] = I18n.t("vacancies.create.success")
      redirect_to admin_vacancies_path
    else
      flash[:error] = I18n.t("vacancies.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_vacancy"), :edit_admin_vacancy_path
  end

  def update
    if @vacancy.update(vacancy_params)
      flash[:success] = I18n.t("vacancies.update.success")
      redirect_to admin_vacancies_path
    else
      flash[:error] = I18n.t("vacancies.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vacancy.destroy

    flash[:success] = I18n.t("vacancies.destroy.success")
    redirect_to admin_vacancies_path
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(
      :name, :status, :location, :job_title_id, :experience, :income_from, :income_to, :income_type, :published_at,
      :description, :team_member_id, :more_info, :employment_type_ids => [], :skill_ids => []
    )
  end

  def find_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

  def employment_types
    @employment_types = EmploymentType.all
  end

  def job_titles
    @job_titles = JobTitle.active
  end

  def skills
    @skills = Skill.all
  end

  def team_members
    @team_members = TeamMember.joins(:job_titles).where(job_titles: { name: "HR Менеджер" })
  end
end
