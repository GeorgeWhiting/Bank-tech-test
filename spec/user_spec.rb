describe User do

  let :bank_class {double(:bank_class, new: bank)}
  let :bank {double(:bank, balance: 10, print_statement: statement)}
  let :statement {double(:statement, print_full: "hello")}
  subject {described_class.new("Geg", bank_class)}


  it "can be initialised with name, address" do
    expect(subject.name).to eq "Geg"
  end

  it "should be able to open a bank account" do
    expect(bank_class).to receive(:new)
    subject.create_bank_account
  end

  it "shouldn't be able to have multiple accounts" do
    subject.create_bank_account
    expect(subject.create_bank_account).to eq "You already have an account"
  end

  describe "#print_statement" do
    it "should print the user's bank statement" do
      subject.create_bank_account
      expect(subject.print_statement).to eq statement
    end
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
