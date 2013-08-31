ActiveAdmin.register Application do
  
  menu :priority => 5

  actions :all, except: [:destroy, :new, :edit]

  filter :name
  filter :email
  filter :university
  filter :advertisement
  filter :sent

  batch_action :mark_as_sent do |selection|
    logger.info "\n\n\nMarking as sent: " + selection.to_s + "\n\n\n"
    Application.find(selection).each do |application|
      application.sent = true
      application.save
    end
    redirect_to :back
  end

  batch_action :mark_as_not_sent do |selection|
    logger.info "\n\n\nMarking as not sent: " + selection.to_s + "\n\n\n"
    Application.find(selection).each do |application|
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
      div style: "font-size:1.6em;color:#b3bcc1;" do
        if application.sent
          icon(:check_alt)
        else
          "..."
        end
      end
    end
    column :CV do |application|
      link_to "Descargar CV", application.resume_url
    end
  end

end