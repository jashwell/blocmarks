class UserMailer < ActionMailer::Base

  def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      topic: email.subject
      bookmark: email.body
    )
  end
end
