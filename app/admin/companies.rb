ActiveAdmin.register Company do

  menu :priority => 3

  filter :name

	index do
    selectable_column
    column :name, :sortable => 'name'
    default_actions
	end

  show do
    attributes_table do
      row :name
      row :website
      row :location
      row :description
    end
  end
  
end
