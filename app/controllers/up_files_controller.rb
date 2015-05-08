class UpFilesController < ApplicationController

  def create
    @up_file = UpFile.new(file_name: params[:file], 
                          site_id: current_site.id, 
                          catalog_item_id: params[:catalog_item_id])
    # @up_file.update(up_file_params)
    if @up_file.save!
      respond_to do |format|
        format.json{ render :json => @up_file }
      end
    end
  end

  def destroy
    @up_file = UpFile.find(params[:id])

    @up_file.destroy

    respond_to do |format|
      format.html { redirect_to current_url }
      format.json { head :no_content }
      format.js   { render nothing: true }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def up_file_params
      params.require(:up_file).permit(:site_id, :catalog_item_id, :file)
    end

end
