describe User do

  let :bank_class {double(:bank_class, new: bank)}
  let :bank {double(:bank, balance: 10)}
  subject {described_class.new("Geg", "123 Street Street", bank_class)}


  it "can be initialised with name, address" do
    expect(subject.name).to eq "Geg"
    expect(subject.address).to eq "123 Street Street"
  end

  it "should be able to open a bank account" do
    expect(bank_class).to receive(:new)
    subject.create_bank_account
  end

  describe "#deposit" do
    it "should call the bank's deposit method" do
      subject.create_bank_account
      expect(bank).to receive(:deposit).with(10)
      subject.deposit(10)
    end
  end

  describe "#withdraw" do
    it "should call the bank's withdraw method" do
      subject.create_bank_account
      expect(bank).to receive(:withdraw).with(10)
      subject.withdraw(10)
    end
  end

  describe "#get_balance" do
    it "should return the user's bank balance" do
      subject.create_bank_account
      expect(subject.get_balance).to eq 10
    end
  end
end
