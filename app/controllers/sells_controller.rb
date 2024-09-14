class SellsController < ApplicationController
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
    @consultation = Message.new
    @message = Message.new
  end

  def search_buyers
    add_breadcrumb I18n.t("app.breadcrumbs.sells_search_buyers"), :sells_search_buyers_path
  end
end
