class UserMailer < ApplicationMailer
  def purchase_reminder purchase
    @purchase = purchase
    mail(to: @purchase.user.email, subject: "Reminder about your purchase")
  end
end
