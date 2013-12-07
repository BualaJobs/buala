#!/bin/env ruby
# encoding: utf-8
class AdvertisementsController < ApplicationController

  respond_to :html
  before_filter :set_advertisement
  before_filter :authenticate_user!, only: [:apply]

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
    begin
      Postulation.create! user: current_user, advertisement: @advertisement
      render nothing: true, status: :created
    rescue ActiveRecord::RecordInvalid
      render nothing: true, status: :bad_request
    end
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
        image: (Cloudinary::Utils.cloudinary_url @advertisement.company.company_logo, width: 200, height: 200, crop: :lpad)
      }
    end
  end

end
