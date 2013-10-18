module ApplicationHelper

  def correct_user
    @corect_site = current_user.sites.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
      flash[:error] = "current_user is not fk admin!"
  end  
end