class SitesController < ApplicationController
   before_action :set_site, only: [:show, :edit, :update, :destroy]
   before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]
   before_filter :correct_user, :only => [:destroy, :edit , :update]

  # before_filter :load_site

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all
  end

  # GET /sites/1
  # GET /sites/1.json
  def show

  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = current_user.sites.new(site_params)


    respond_to do |format|
      if @site.save
        # @main_menu = @site.Page.create

        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site }
      else
        format.html { render action: 'new' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to current_url, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end



  private

    def load_site
      @site = Site.where('domain = ?', request.host).first!
    end

    #Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:domain, :sub_domain, :name, :theme, :user_id, :front_page_id, :remove_site_logo, :site_logo, :site_logo_cache, :image_slot_1_cache, :image_slot_1, :footer_text, :shop_active, :owner_email, :big_image_text)
    end

end
