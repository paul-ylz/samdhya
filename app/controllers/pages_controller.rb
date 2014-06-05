class PagesController < ApplicationController
  def home
    @page = Page.find_by(title: 'Home')
  end

  def index
  end

  def show
    @page = Page.find(params[:id])
  end

end
