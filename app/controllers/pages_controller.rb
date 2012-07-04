class PagesController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password'], except: :show_page
  
  def index
  	@pages = Page.all
  end

  def show
  	@page = Page.find(params[:id])
  end

  def new
  	@page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page
    else
      render 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:success] = "Page updated."
      redirect_to @page
    else
      render 'edit'
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    flash[:success] = "Page destroyed."
    redirect_to pages_path
  end
  
  def show_page
  	@page = Page.find_by_url(params[:url])
  end

end
