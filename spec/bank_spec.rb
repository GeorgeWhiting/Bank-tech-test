describe Bank do

  let :transaction_class {double(:transaction_class, new: transaction)}
  let :transaction {double(:transaction, date: "1/1/18", amount: 10, balance: 10)}
  let :user {double(:user, name: "Geg", address: "123 Street Street")}
  subject {described_class.new(transaction_class)}

  describe "#balance" do
    it "should return a balance" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#transaction_history" do
    it "should have a list of transactions" do
      expect(subject.transaction_history).to eq []
    end
  end

  describe "#deposit" do
    it "should increase the balance" do
      expect {subject.deposit(10)}.to change {subject.balance}.by 10
    end

    it "should create a transaction with the correct details" do
      expect(transaction_class).to receive(:new)
      subject.deposit(10)
      expect(subject.transaction_history).to include transaction
    end
  end

  describe "#withdraw" do

    let :transaction_class {double(:transaction_class, new: withdrawal)}
    let :withdrawal {double(:withdrawal, date: "1/1/18", amount: 5, balance: 5)}

    it "should decrease the balance" do
      subject.deposit(10)
      expect {subject.withdraw(5)}.to change {subject.balance}.by -5
    end

    it "should create a transaction with the correct details" do
      subject.deposit(10)
      expect(transaction_class).to receive(:new)
      subject.withdraw(5)
      expect(subject.transaction_history).to include withdrawal
    end

    it "should reject a withdrawal that would bring the balance below 0" do
      subject.deposit(10)
      expect {subject.withdraw(15)}.to change {subject.balance}.by 0
      expect(subject.withdraw(15)).to eq "You don't have that much money"
    end
  end

end
