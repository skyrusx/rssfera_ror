class PartnersController < ApplicationController
  add_breadcrumb I18n.t("admin_breadcrumbs.partners"), :partners_path

  def index
    @partners = Partner.active
  end
end
