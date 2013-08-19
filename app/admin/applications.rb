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
    column :CV do |application|
      link_to "Descargar CV", application.resume.url
    end
  end

end