require 'User'

describe User do

  let :bank {double(:bank)}

  it "can be initialised with name, address" do
    user = User.new("Geg", "123 Street Street")
    expect(user.name).to eq "Geg"
    expect(user.address).to eq "123 Street Street"
  end

  it "should have an associated bank account" do
    user = User.new("Geg", "123 Street Street")
    user.assign_bank_account(bank)
    expect(user.bank_account).to eq bank
  end
end
