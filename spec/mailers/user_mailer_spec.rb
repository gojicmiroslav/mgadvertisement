require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:advertisement_id){ 1 }
  let(:email){ email = UserMailer.advertisement_created('author@email.com', advertisement_id).deliver_now }

  it 'sends advertisement created email to author' do
  	expect(email.to).to include('author@email.com')
  end

  it 'has correct subject' do
    expect(email.subject).to eq('Congratulations with your new advertisement!')
  end

  it 'has correct body' do
    body_message = "Your advertisement is currently on pending status.\nYou will receive another email if your advertisement has been approved.\nThank you!"
    expect(email.body.to_s).to include(body_message)
  end
  
end
