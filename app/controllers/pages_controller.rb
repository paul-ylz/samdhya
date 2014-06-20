class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update]

  def samdhya
    @page = Page.find_by(slug: 'samdhya')
    render 'show'
  end

  def index
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(permitted_params)
    if @page.save
      redirect_to show_page_url @page
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(permitted_params)
      redirect_to @page
    else
      render 'edit'
    end
  end

  private

  def permitted_params
    params.require(:page).permit(:title, :content)
  end

  def set_page
    @page = Page.find_by(slug: params[:id])
  end
end
