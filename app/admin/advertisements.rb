ActiveAdmin.register Advertisement do

	menu :priority => 4

	filter :title
	filter :description

	index do
		selectable_column
		column :title, :sortable => 'title'
		column :company
		column :advertisement_type
		column :published do |advertisement|
			if advertisement.published 
				status_tag("Published", :ok)
			else
				status_tag("Not published", :error)
			end
		end
		default_actions
	end

	show do
		attributes_table do
			row :title
			row :company
			row :advertisement_type
			row :category_1
			row :category_2
			row :start_date
			row :description
			row :published
			row :is_paid
			row :working_turn
			row :vacancies
		end
	end

	form do |f|
    f.inputs do
      f.input :title
      f.input :advertisement_type
      f.input :company
      f.input :category_1
      f.input :category_2
      f.input :start_date, as: :datepicker
      f.input :description
      f.input :published
      f.input :is_paid
      f.input :working_turn
      f.input :vacancies
    end
    f.actions
  end
  
end
