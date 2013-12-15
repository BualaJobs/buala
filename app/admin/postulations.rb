ActiveAdmin.register Postulation do

  menu priority: 5

  filter :advertisement

  index do
    selectable_column
    column :user
    column :advertisement
  end
  
end
