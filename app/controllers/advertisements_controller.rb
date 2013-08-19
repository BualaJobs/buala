#!/bin/env ruby
# encoding: utf-8
class AdvertisementsController < ApplicationController

  respond_to :html
  before_filter :set_advertisement

  def show
    if request.path != advertisement_path(@advertisement)
      redirect_to @advertisement, status: :moved_permanently
    else

      @json = @advertisement.company.to_gmaps4rails do |advertisement, marker|
        marker.title @advertisement.company.name
      end
    end
  end

  def apply
    if request.post?
      @application = Application.create request.params[:application]
      if @application.valid?
        redirect_to thanks_advertisement_path(@advertisement)
        return
      end
    end
    @application ||= Application.new advertisement: @advertisement
    @application.accept_terms_and_conditions = '0'
  end

  def thanks
  end

  private
  def set_advertisement
    @advertisement = Advertisement.published.find(params[:id])

    if @advertisement
      title = "#{@advertisement.title} en #{@advertisement.company.name}"
      description = "#{@advertisement.company.name} busca #{@advertisement.title}, postulate a través
      de Bualá! Jobs"

      set_meta_tags title: "Bualá! Jobs - #{title}"
      set_meta_tags description: description

      set_meta_tags :og => {
        title: title,
        description: description,
        url: (advertisement_url @advertisement),
        image: (Cloudinary::Utils.cloudinary_url @advertisement.company.company_logo, width: 200, height: 200, crop: :pad)
      }
    end
  end

end
