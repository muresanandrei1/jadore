class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Multumim pentru mesaj'
      redirect_to root_path
    else
      flash.now[:notice] = 'Mesajul nu a fost trimis, va rugam incercati din nou'
      render :new
    end
  end
end
