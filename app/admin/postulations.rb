ActiveAdmin.register Postulation do

  menu priority: 5

  filter :advertisement

  index do
    selectable_column
    column :user
    column :advertisement
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :user_id, label: 'User', as: :select, collection: User.all.map{|u| ["#{u.fullname} - #{u.email}", u.id]}
      f.input :advertisement
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :advertisement
    end
  end
  
end
