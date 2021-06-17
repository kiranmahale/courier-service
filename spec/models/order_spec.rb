require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:recipient) {
    Recipient.create(
      email:"jane@doe.com",
      mobile: 1234567890,
      full_name: "Twest",
      address: "testing",
      pincode: '767659'
    )
  }

  let(:sender) {
    Sender.create(
      email:"jane@doe.com",
      mobile: 1234567890,
      full_name: "Twest",
      address: "testing",
      pincode: '767659'
    )
  }

  subject {
    described_class.new(weight: 22.5,
                        service_type: "Regular",
                        payment_mode: 'COD',
                        status: 'Delivered',
                        parcel_number: 'PN7947713',
                        recipient_id: recipient.id,
                        sender_id: sender.id,
                        cost: 33 
                        )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without sender" do
    subject.sender = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without recipient" do
    subject.recipient = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without weight" do
    subject.weight = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without service type" do
    subject.service_type = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without payment mode" do
    subject.payment_mode = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without cost" do
    subject.cost = nil
    expect(subject).to_not be_valid
  end
end
