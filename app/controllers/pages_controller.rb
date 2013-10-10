class PagesController < ApplicationController
  # before_filter :load_page, :on => [:show]

  def show 
    load_page
  end

  def front
    @page = Page.find(current_site.front_page_id)
    render :show
  end



  private

    def load_page
      @page = current_site.pages.find(params[:id])
    end
end
