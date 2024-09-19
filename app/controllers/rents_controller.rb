class RentsController < ApplicationController
  include ApplicationHelper

  def index
    add_breadcrumb I18n.t("app.breadcrumbs.rents"), :rents_path

    @message = Message.new
    @category = RealtyCategory.find_by(slug: "rent")
    @realties = Realty.active.where(realty_category_id: @category.id).order(:created_at)
  end

  def out
    add_breadcrumb I18n.t("app.breadcrumbs.rents_out"), :rents_out_path

    @message_extended = Message.new
    @message_short = Message.new
  end
end
