ActiveAdmin.register Application do
  
  menu :priority => 5

  actions :all, except: [:destroy, :new, :edit]

  filter :name
  filter :email
  filter :university
  filter :advertisement

  index do
    selectable_column
    column :name
    column :email
    column :university
    column :advertisement
    default_actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :university
      row :advertisement
      row :resume
    end
  end

end