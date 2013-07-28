class AdvertisementsController < ApplicationController

  respond_to :html

  def show 
    @advertisement = Advertisement.published.find(params[:id])
  end

end
