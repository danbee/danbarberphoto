class Notifier < ActionMailer::Base
  default :from => "enquiries@danbarberphoto.com"
  
  def contact_notification(sender)
    @sender = sender
    mail( :to => 'danbee@gmail.com',
          :from => sender.email,
          :subject => sender.subject)
  end
end
