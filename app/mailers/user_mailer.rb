class UserMailer < ApplicationMailer

  def advertisement_created(email, advertisement_id)
    @advertisement_id = advertisement_id
    mail to: email, subject: 'Congratulations with your new advertisement!'
  end

  def advertisement_updated(email, advertisement)
    @advertisement = advertisement
    mail to: email, subject: 'Your advertisement status has been updated!'
  end
end
