class RealtiesController < ApplicationController
  def show
    @realty = Realty.find_by(slug: params[:slug])
    page_name = @realty.realty_category.name
    path = @realty.realty_category.slug == "rent" ? :rents_realty_path : "#"
    realty_page_name = "Код объекта #{@realty.slug}"

    add_breadcrumb page_name, :rents_path
    add_breadcrumb realty_page_name, path

    @team_member = TeamMember.find_by(id: @realty.team_member_id)
    @similar_realties = {
      by_price: Realty.where.not(id: @realty.id)
                      .where(realty_category_id: @realty.realty_category_id,
                             price: @realty.price - 5000.0..@realty.price + 5000.0),
      by_location: Realty.where.not(id: @realty.id)
                         .where(realty_category_id: @realty.realty_category_id, district_id: @realty.district_id)
    }
  end
end
