#!/bin/env ruby
# encoding: utf-8
ActiveAdmin.register Company do

  menu :priority => 3

  filter :name

	index do
    selectable_column
    column :name, :sortable => 'name'
    column :admin_link do |company|
      link_to "Link de administración", "#{company_url(company)}?token=#{company.admin_token}"
    end
    default_actions
	end

  show do
    attributes_table do
      row :name
      unless company.company_logo.blank?
        row :company_logo do |company|
          image_tag company.company_logo_url     
        end
      end
      row :company_type
      row :category
      row :website
      row :location
      row :description
      row :token do |company|
        link_to "Link de administración", "#{company_url(company)}?token=#{company.admin_token}"
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :company_logo
      f.input :company_type
      f.input :category
      f.input :website
      f.input :location
      f.input :description
    end
    f.actions
  end
  
end
