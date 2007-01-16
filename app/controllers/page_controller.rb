class PageController < ApplicationController

  def view
    @item = Item.find(Item.accessor2id(params[:id]))
  rescue
    flash[:notice] = 'The item you requested does no longer exist. Maybe it has been removed.'
    redirect_to(:action => 'index')
  end
  
  def imprint
  end
  
  def contact
  end
  
  def send_contact_form
    if request.post?
      Mailer::deliver_contactform_message(params[:author])
      redirect_to :action => 'contact'
      flash[:notice] = "Your message has been sent. Thank you!"
    end
  end 

  def index
  end
  
  def dump
    @item = Item.new(params[:item])
    @item.date_added = Time.now()
    @item.remote_ip = request.remote_ip
    if @item.save
      render :action => 'success'
    else
      render :action => 'index'
    end
  end
  
  def latest
    @items = Item.latest_items
  end
end
