class Admin::TeamMembersController < AdminController
  before_action :find_team_member, only: [:show, :edit, :update, :destroy, :delete_photo]
  before_action :job_titles, only: [:new, :create, :edit, :update]
  before_action :team_members, only: [:index, :new, :create, :edit, :update]

  add_breadcrumb I18n.t("admin_breadcrumbs.team_members"), :admin_team_members_path

  def index
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_team_member"), :admin_team_member_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_team_member"), :new_admin_team_member_path

    @team_member = TeamMember.new
  end

  def create
    @team_member = TeamMember.new(team_member_params)

    if @team_member.save
      flash[:success] = I18n.t("teams.create.success")
      redirect_to admin_team_members_path
    else
      flash[:error] = I18n.t("teams.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_team_member"), :edit_admin_team_member_path
  end

  def update
    if @team_member.update(team_member_params)
      flash[:success] = I18n.t("teams.update.success")
      redirect_to admin_team_members_path
    else
      flash[:error] = I18n.t("teams.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team_member.destroy

    flash[:success] = I18n.t("teams.destroy.success")
    redirect_to admin_team_members_path
  end

  def delete_photo
    @photo = ActiveStorage::Attachment.find(params[:image_id])
    if @photo.purge
      flash[:success] = I18n.t("teams.delete_photo.success")
    else
      flash[:error] = I18n.t("teams.delete_photo.error")
    end
    redirect_to edit_admin_team_member_path(id: @team_member.id)
  end

  private

  def team_member_params
    params.require(:team_member).permit(
      :first_name, :last_name, :patronymic_name, :slug, :phone, :email, :info, :whatsapp, :status, :photo, :position,
      :rating, :job_title_ids => [], :review_ids => [], :vacancy_ids => []
    )
  end

  def find_team_member
    @team_member = TeamMember.find(params[:id])
  end

  def job_titles
    @job_titles = JobTitle.active
  end

  def team_members
    @team_members = TeamMember.paginate(page: params[:page], per_page: 10).order(:position)
    @total_team_members = TeamMember.all.size
  end
end
