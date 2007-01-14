class Mailer < ActionMailer::Base
   def contactform_message(author)
     @recipients       = "me@mysite.com"
     @from             = author[:email]
     @subject          = "New message"
     @body['name']     = author[:name]
     @body['email']    = author[:email]
     @body['message']  = author[:message]
   end
end
