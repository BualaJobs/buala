ActiveAdmin.register User do
  
  index do
    selectable_column
    column :email
    column :created_at
    column :fullname
    column :degree
    column do |user|
      unless user.resume.blank?
        link_to "Resume", user.resume.url
      end
    end
    default_actions
  end

end
