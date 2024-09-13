class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.fields = params[:fields]
    @message.save

    if @message.save
      flash[@message.category] = true
      flash[:success] = I18n.t("app.form.messages.create.success")
    else
      flash[:error] = I18n.t("app.form.messages.create.error")
    end

    redirect_back fallback_location: root_path
  end

  private

  def message_params
    params.require(:message).permit(:status, :category, :name, :images => [], :fields => '{}')
  end
end
