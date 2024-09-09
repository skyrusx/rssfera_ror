class PartnersController < ApplicationController
  include ApplicationHelper

  def index
    add_breadcrumb meta_data.page_name, :partners_path

    @partners = Partner.active
  end
end
