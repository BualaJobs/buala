ActiveAdmin.register University do

  menu priority: 6

  filter :name

  config.sort_order = "name_asc"
  config.paginate = false

  index do
    selectable_column
    column :name
    default_actions
  end
  
end
