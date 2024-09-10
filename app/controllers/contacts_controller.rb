class ContactsController < ApplicationController
  include ApplicationHelper

  def index
    add_breadcrumb meta_data.page_name, :contacts_path

    @message = Message.new
  end
end
