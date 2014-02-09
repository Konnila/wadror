require 'spec_helper'

describe User do
  it "has the username set correctly" do
    user = User.new username:"Pekka"

    user.username.should == "Pekka"
  end

  it "is not saved without a password" do
    user = User.create username:"Pekka"

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end

  it "is saved with a proper password" do
    user = User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1"

    expect(user.valid?).to be(true)
    expect(User.count).to eq(1)
  end

  it "is not saved with too short password" do
  	user = User.create username:"Pekka", password:"Se", password_confirmation:"Se"

  	expect(user.valid?).to be(false)
  	expect(User.count).to eq(0)
  end

  it "is not saved with password that has only letters" do
  	user = User.create username:"Pekka", password:"kekekeke", password_confirmation:"kekekeke"

  	expect(user.valid?).to be(false)
  	expect(User.count).to eq(0)
  end

end
