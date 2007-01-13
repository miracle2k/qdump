class PageController < ApplicationController

  def view
    @item = Item.find(Item.accessor2id(params[:id]))
  rescue
    flash[:notice] = 'The item you requested does no longer exist. Maybe it has been removed.'
    redirect_to(:action => 'index')
  end
  
  def about
  end
  
  def imprint
  end
  
  def contact
  end
  
  def index
  end
  
  def do_dump
    @item = Item.new(params[:item])
    @item.date_added = Time.now()
    if @item.save
      flash[:notice] = 'Item was successfully created.'
      redirect_to :action => 'index'
    else
      flash[:notice] = 'Item creation failed.'
      render :action => 'index'
    end
  end
  
  def latest
    @items = Item.latest_items
  end
end
