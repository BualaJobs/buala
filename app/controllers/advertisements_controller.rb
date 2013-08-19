#!/bin/env ruby
# encoding: utf-8
class AdvertisementsController < ApplicationController

  respond_to :html

  def show 
    @advertisement = Advertisement.published.find(params[:id])

    if request.path != advertisement_path(@advertisement)
      redirect_to @advertisement, status: :moved_permanently
    else

      @json = @advertisement.company.to_gmaps4rails do |advertisement, marker|
        marker.title @advertisement.company.name
      end

      title = "Bualá! Jobs - #{@advertisement.title} en #{@advertisement.company.name}"
      description = "#{@advertisement.company.name} busca #{advertisement.title}, postulate a través
      de Bualá! Jobs"

      set_meta_tags title: title
      set_meta_tags description: description

      set_meta_tags :og => {
        site: "Bualá! Jobs",
        title: title,
        description: description,
        url: (advertisement_url @advertisement)
      }
    end

  end

  def apply
    @advertisement = Advertisement.published.find(params[:id])
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
    @advertisement = Advertisement.published.find(params[:id])
  end

end
