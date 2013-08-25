EmailPreview.register 'After application email' do
  application = Application.first
  UserMailer.after_application_email(application) if application
end