class Admin::ReviewsController < AdminController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :team_members, only: [:new, :create, :edit, :update]

  add_breadcrumb I18n.t("admin_breadcrumbs.reviews"), :admin_reviews_path

  def index
    @reviews = Review.all.order("author DESC")
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_review"), :admin_review_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_review"), :new_admin_review_path

    @review = Review.new
    @time_now = Time.new.strftime("%Y-%m-%dT%k:%M")
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = I18n.t("reviews.create.success")
      redirect_to admin_reviews_path
    else
      flash[:error] = I18n.t("reviews.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_review"), :edit_admin_review_path
  end

  def update
    if @review.update(review_params)
      flash[:success] = I18n.t("reviews.update.success")
      redirect_to admin_reviews_path
    else
      flash[:error] = I18n.t("reviews.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy

    flash[:success] = I18n.t("reviews.destroy.success")
    redirect_to admin_reviews_path
  end

  def delete_avatar
    @avatar = ActiveStorage::Attachment.find(params[:avatar_id])
    if @avatar.purge
      flash[:success] = I18n.t("reviews.delete_avatar.success")
    else
      flash[:error] = I18n.t("reviews.delete_avatar.error")
    end
    redirect_to edit_admin_review_path(id: @review.id)
  end

  private

  def review_params
    params.require(:review).permit(:author, :email, :feedback, :rating, :published_at, :status, :avatar, :team_member_id)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def team_members
    @team_members = TeamMember.active
  end
end
