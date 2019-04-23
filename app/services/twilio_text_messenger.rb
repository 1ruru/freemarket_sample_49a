class TwilioTextMessenger
  attr_reader :message
  attr_reader :phone

  def initialize(message, phone)
    @message = message
    @phone = phone
  end

  def send_code
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.credentials.twilio_phone_number,
      to: '+81' + phone,
      body: message
    })
  end
end
#How to use
#TwilioTextMessenger.new(message, '8085141781').send_code