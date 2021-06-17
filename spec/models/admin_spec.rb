require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject {
    described_class.new(email: "test@gmail.com",
                        password: "Test@123",
                        password_confirmation: 'Test@123')
  }

  it "is not valid with invalid attributes" do
    expect(Admin.new).to_not be_valid
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without password_confirmation" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
