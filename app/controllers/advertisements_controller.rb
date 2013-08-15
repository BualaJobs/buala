#!/bin/env ruby
# encoding: utf-8
class AdvertisementsController < ApplicationController

  respond_to :html

  def show 
    @advertisement = Advertisement.published.find(params[:id])

    if request.path != advertisement_path(@advertisement)
      redirect_to @advertisement, status: :moved_permanently
    else

      set_meta_tags :title => "Bualá! Jobs - #{@advertisement.title} en #{@advertisement.company.name}"
      set_meta_tags :description => @advertisement.truncated_description

      set_meta_tags :og => {
        site: "Bualá Jobs",
        title: @advertisement.title,
        url: (advertisement_url @advertisement)
      }
      if @advertisement.description.length > 250
        set_meta_tags :og => {
          description: @advertisement.truncated_description,
        }
      else
        set_meta_tags :og => {
          description: @advertisement.description,
        }
      end
      unless @advertisement.company.company_logo.blank?
        set_meta_tags :og => {
          image: @advertisement.company.company_logo_url
        }
      end
    end

  end

  def apply
    @advertisement = Advertisement.published.find(params[:id])
  end

end
