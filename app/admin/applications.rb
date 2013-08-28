ActiveAdmin.register Application do
  
  menu :priority => 5

  actions :all, except: [:destroy, :new, :edit]

  filter :name
  filter :email
  filter :university
  filter :advertisement
  filter :sent

  batch_action :mark_as_sent do |selection|
    Application.find(selection) do |application|
      application.sent = true
      application.save
    end
    redirect_to :back
  end

  batch_action :mark_as_not_sent do |selection|
    Application.find(selection) do |application|
      application.sent = false
      application.save
    end
    redirect_to :back
  end

  index do
    selectable_column
    column :name
    column :email
    column :university
    column :degree
    column :advertisement
    column :status do |application|
      if application.sent
        status_tag('SENT', :ok)
      else
        status_tag('NOT SENT', :error)
      end
    end
    column :CV do |application|
      link_to "Descargar CV", application.resume.url
    end
  end

end