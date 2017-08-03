require 'rails_helper'
begin
  User
rescue
  User = nil
end

RSpec.describe User, :type => :model do

  describe "password encryption" do
    it "does not save passwords to the database" do
      User.create!(email: "frankbi322", tag: "thelastazn", password: "abcdef", is_guest?: true)
      user = User.find_by_email("frankbi322")
      expect(user.password).not_to be("abcdef")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(email: "frankbi322", tag: "thelastazn", password: "abcdef", is_guest?: true)
    end
  end

  describe "session token" do
    it "assigns a session_token if one is not given" do
      frank = User.create(email: "frankbi322", tag: "thelastazn", password: "abcdef", is_guest?: true)
      expect(frank.session_token).not_to be_nil
    end
  end

  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
