class UserNotifier < ActionMailer::Base
  default from: "david.mandelbaum@yale.edu",
          content_type: "multipart/alternative",
          parts_order: [ "text/html", "text/enriched", "text/plain", "application/pdf" ]

  def translation_ready_email(entry, path)
    @user = User.find(entry.user_id)
    @email = @user.email
    attachments["I-589.pdf"] = File.read(path)
    mail(to: @email, subject: 'Your translated application is available')
  end
end
