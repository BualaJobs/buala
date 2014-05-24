ActiveAdmin.register Category do
  
  filter :name

  index do
    selectable_column
    column :name
    default_actions
  end

  show do
    attributes_table do
      row :name
    end
  end

end
