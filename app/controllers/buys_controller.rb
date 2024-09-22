class BuysController < ApplicationController
  include ApplicationHelper

  def index
    realty_type = if params[:realty_id].present? && Realty::MENU_TYPES.keys.include?(params[:realty_id].to_i)
                    Realty::MENU_TYPES[params[:realty_id].to_i]
                  else
                    "недвижимость"
                  end
    breadcrumb = [I18n.t("app.breadcrumbs.sells"), realty_type.downcase].join(" ")

    add_breadcrumb breadcrumb, :sells_path

    @current_realty = Realty::MENU_TYPES[params[:realty_id].to_i]
    @current_realty_type = Realty::TYPES[params[:realty_id].to_i]

    @message = Message.new

    @category = RealtyCategory.find_by(slug: "buy")
    @realties = Realty.active.where(realty_category_id: @category.id).order(:created_at)
  end

  def base
    add_breadcrumb I18n.t("app.breadcrumbs.rents_out"), :buys_base_path

    @message_extended = Message.new
    @message_short = Message.new
  end
end
