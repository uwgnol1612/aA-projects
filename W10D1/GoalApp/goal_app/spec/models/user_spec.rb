require 'rails_helper'

RSpec.describe User, type: :model do
    # pending "add some examples to (or delete) #{__FILE__}"

    subject(:user) do
      User.create(
        username: "lmcfarlin",
        password: "secretpassword"
      )
    end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:goals) }

  it "creates a password digest when a password is given" do #is_password(password)
    expect(user.password_digest).to_not be_nil
  end 

  it "creates a session token before validation" do #ensure_session_token
    user.valid?
    expect(user.session_token).to_not be_nil 
  end 

  describe "#reset_session_token!" do 
    it "sets a new session token on the user" do 
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end 

    it "returns the new session token" do 
      expect(user.reset_session_token!).to eq(user.session_token)
    end 
  end 

  describe "#is_password?" do
    it "verifies a password is correct" do 
      expect(user.is_password?("secretpassword")).to be(true)
    end 

    it "reject an incorrect password" do 
      expect(user.is_password?("hunter2")).to be(false)
    end 
  end 

  describe "::find_by_credentials" do 
    before {user.save!}

    it "returns the user given correct credentials" do
      expect(User.find_by_credentials("lmcfarlin", "secretpassword")).to eq(user)
    end

    it "return nil given incorrect credentials" do 
      expect(User.find_by_credentials("lmfarlin", "hunter2")).to be_nil
    end 
  end 
  
end
