class Admin::SkillsController < AdminController
  before_action :find_skill, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t("admin_breadcrumbs.skills"), :admin_skills_path

  def index
    @skills = Skill.all
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_skill"), :admin_skill_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_skill"), :new_admin_skill_path

    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      flash[:success] = I18n.t("skills.create.success")
      redirect_to admin_skills_path
    else
      flash[:error] = I18n.t("skills.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_skill"), :edit_admin_skill_path
  end

  def update
    if @skill.update(skill_params)
      flash[:success] = I18n.t("skills.update.success")
      redirect_to admin_skills_path
    else
      flash[:error] = I18n.t("skills.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @skill.destroy

    flash[:success] = I18n.t("skills.destroy.success")
    redirect_to admin_skills_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :status, :vacancy_ids => [])
  end

  def find_skill
    @skill = Skill.find(params[:id])
  end
end
