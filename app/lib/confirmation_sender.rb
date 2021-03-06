module ConfirmationSender
  def self.send_confirmation_to(user)
    verification_code = CodeGenerator.generate
    user.update(verification_code: verification_code)
    TwilioTextMessenger.new(verification_code, '9042971555').send_code
  end
end