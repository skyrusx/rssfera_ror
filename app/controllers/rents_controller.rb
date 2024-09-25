class RentsController < ApplicationController
  include ApplicationHelper

  def index
    add_breadcrumb I18n.t("app.breadcrumbs.rents"), :rents_path

    @message = Message.new
    @category = RealtyCategory.find_by(slug: "rent")

    @search = params[:search] || {}
    @realties = Realty.active.where(realty_category_id: @category.id).order(:created_at)
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

  def out
    add_breadcrumb I18n.t("app.breadcrumbs.rents_out"), :rents_out_path

    @message_extended = Message.new
    @message_short = Message.new
  end

  private

  def filtering_params(params)
    params.slice(:type_object, :price, :total_area, :floor, :city, :district, :street, :number_rooms)
  end
end
