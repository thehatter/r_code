class PagesController < ApplicationController
  # before_filter :load_page, :on => [:show]

  # def show

  # end

  def front
    @page = Page.find(current_site.front_page_id)
    render :show
  end



  private

    # def load_page
    #   @page = Page.where('domain = ?', request.host).first!
    # end
end
