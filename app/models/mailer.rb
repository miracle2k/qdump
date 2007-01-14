class Mailer < ActionMailer::Base
   def contactform_message(author)
     @recipients       = "michael@podster.de"
     @from             = author[:email]
     @subject          = "Contact form (qdump)"
     @body['name']     = author[:name]
     @body['email']    = author[:email]
     @body['message']  = author[:message]
   end
end
