class Admin::MessagesController < AdminController
  before_action :find_message, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t("admin_breadcrumbs.messages"), :admin_messages_path

  def index
    @messages = Message.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    @total_messages = Message.all.size
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_message"), :admin_message_path
    @message.status = :viewed
    @message.save
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_message"), :edit_admin_message_path
  end

  def update
    if @message.update(message_params)
      @message.fields = params[:fields]
      @message.save

      flash[:success] = I18n.t("messages.update.success")
      redirect_to admin_messages_path
    else
      flash[:error] = I18n.t("messages.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy

    flash[:success] = I18n.t("messages.destroy.success")
    redirect_to admin_messages_path
  end

  private

  def message_params
    params.require(:message).permit(:status, :category, :name, :fields => '{}')
  end

  def find_message
    @message = Message.find(params[:id])
  end
end
