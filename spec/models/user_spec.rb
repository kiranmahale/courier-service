require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
                        email:"jane@doe.com",
                        mobile: 1234567890,
                        full_name: "Twest",
                        address: "testing",
                        pincode: '767659')
  }

  it "is not valid with invalid attributes" do
    expect(User.new).to_not be_valid
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without mobile" do
    subject.mobile = nil
    expect(subject).to_not be_valid
  end
  
  it "is invalid without pincode" do
    subject.pincode = nil
    expect(subject).to_not be_valid
  end  
end
