class Admin::ContactsController < AdminController
  before_action :find_contact, only: [:show, :edit, :update]

  def index
    @contacts = Contact.all
  end

  def show
    add_breadcrumb I18n.t("admin_breadcrumbs.show_contact"), :admin_contact_path
  end

  def new
    add_breadcrumb I18n.t("admin_breadcrumbs.new_contact"), :new_admin_contact_path

    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:success] = I18n.t("contacts.create.success")
      redirect_to admin_contacts_path
    else
      flash[:error] = I18n.t("contacts.create.error")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb I18n.t("admin_breadcrumbs.edit_contact"), :edit_admin_contact_path
  end

  def update
    if @contact.update(contact_params)
      @contact.work_schedule = params[:work_schedule]
      @contact.save
      flash[:success] = I18n.t("contacts.update.success")
      redirect_to admin_contact_path(@contact.id)
    else
      flash[:error] = I18n.t("contacts.update.error")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy

    flash[:success] = I18n.t("contacts.destroy.success")
    redirect_to admin_contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:address_full, :address_short, :phone, :email, :self_emloyed, :inn, :work_schedule => '{}')
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end
end
