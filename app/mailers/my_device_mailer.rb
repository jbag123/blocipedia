class MyDeviseMailer < Devise::Mailer
  layout 'mailers'

  # To make sure that your mailer uses the devise views
  default template_path: 'devise/mailer'

 def confirmation_instructions(record, token, options={})
   # Use different e-mail templates for signup e-mail confirmation
   #   and for when a user changes e-mail address.
     options[:template_name] = 'confirmation_instructions'
   super
  end
end
