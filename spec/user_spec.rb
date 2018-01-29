describe User do

  subject {described_class.new("Geg", "123 Street Street")}
  let :bank {double(:bank, balance: 10)}

  it "can be initialised with name, address" do
    expect(subject.name).to eq "Geg"
    expect(subject.address).to eq "123 Street Street"
  end

  it "should have an associated bank account" do
    subject.assign_bank_account(bank)
    expect(subject.bank_account).to eq bank
  end

  describe "#deposit" do
    it "should call the bank's deposit method" do
      subject.assign_bank_account(bank)
      expect(bank).to receive(:deposit).with(10)
      subject.deposit(10)
    end
  end

  describe "#withdraw" do
    it "should call the bank's withdraw method" do
      subject.assign_bank_account(bank)
      expect(bank).to receive(:withdraw).with(10)
      subject.withdraw(10)
    end
  end

  describe "#get_balance" do
    it "should return the user's bank balance" do
      subject.assign_bank_account(bank)
      expect(subject.get_balance).to eq 10
    end
  end
end
