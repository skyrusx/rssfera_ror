class BuysController < ApplicationController
  include ApplicationHelper

  def index
    realty_type = if params[:realty_id].present? && Realty::MENU_TYPES.keys.include?(params[:realty_id].to_i)
                    Realty::MENU_TYPES[params[:realty_id].to_i]
                  else
                    "недвижимость"
                  end
    breadcrumb = [I18n.t("app.breadcrumbs.buys"), realty_type.downcase].join(" ")

    add_breadcrumb breadcrumb, :sells_path

    @current_realty = Realty::MENU_TYPES[params[:realty_id].to_i]
    @current_realty_type = Realty::TYPES[params[:realty_id].to_i]

    @message = Message.new

    @category = RealtyCategory.find_by(slug: "buy")
    @realties = Realty.active.where(realty_category_id: @category.id, type_object: params[:realty_id]).order(:created_at)
    @search = params[:search] || {}
    if @search.present?
      @search = @search.reject { |_, v| v.empty? }
      @districts = @search[:city].present? ? City.find_by(id: @search[:city]).districts.pluck(:name, :id) : []
      @streets = @search[:district].present? ? District.find_by(id: @search[:district]).streets.pluck(:name, :id) : []

      filtering_params(@search).each do |key, value|
        value = value.split(",") if key == "number_rooms"
        @realties = @realties.public_send("filter_by_#{key}", value) if value.present?
      end
    else
      @districts = []
      if params[:city_id].present?
        @districts = City.find(params[:city_id]).districts

        if request.xhr?
          respond_to do |format|
            format.json {
              render json: {districts: @districts}
            }
          end
        end
      end

      @streets = []
      if params[:district_id].present?
        @streets = District.find(params[:district_id]).streets

        if request.xhr?
          respond_to do |format|
            format.json {
              render json: {streets: @streets}
            }
          end
        end
      end
    end
  end

  def base
    add_breadcrumb I18n.t("app.breadcrumbs.rents_out"), :buys_base_path

    @message_extended = Message.new
    @message_short = Message.new
  end

  private

  def filtering_params(params)
    params.slice(:type_object, :price, :total_area, :floor, :city, :district, :street, :number_rooms)
  end
end
