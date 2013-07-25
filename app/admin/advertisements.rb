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
			row :company
			row :category_1
			row :category_2
			row :description
		end
	end

	form do |f|
    f.inputs do
      f.input :title
      f.input :company
      f.input :category_1
      f.input :category_2
      f.input :description
      f.input :published
    end
    f.actions
  end
  
end
