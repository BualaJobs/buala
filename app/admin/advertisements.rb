ActiveAdmin.register Advertisement do

	menu :priority => 4

	filter :title
	filter :description

	index do
		selectable_column
		column :title, :sortable => 'title'
		column :company
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
			row :description
			row :company
		end
	end
  
end
