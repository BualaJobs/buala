ActiveAdmin.register User do
  
  index do
    selectable_column
    column :email
    column :created_at
    column :fullname
    column :degree
    column do |user|
      unless user.resume.blank?
        link_to "Resume", user.resume.expiring_url(60)
      end
    end
    default_actions
  end

  show do
    attributes_table do
      row :fullname
      row :email
      row :university
      row :degree
      row :resume do
        unless user.resume.blank?
          link_to "Resume", user.resume.expiring_url(60)
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :fullname
      f.input :email
      f.input :university
      f.input :degree
      f.input :resume, as: :file, hint: (f.object.resume.blank? ? "No resume uploaded yet" : (link_to "Resume", f.object.resume.expiring_url(60)))
    end
    f.actions
  end

end
