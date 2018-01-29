describe Bank do

  let :transaction_class {double(:transaction_class, new: transaction)}
  let :statement_class {double(:statement_class, new: statement)}
  let :transaction {double(:transaction, date: "1/1/18", amount: 10, balance: 10)}
  let :statement {double(:statement, print_full: "hello")}
  let :user {double(:user, name: "Geg")}
  subject {described_class.new(transaction_class, statement_class)}

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

    it "should not accept a negative amount" do
      expect {subject.deposit(-10)}.to change {subject.balance}.by 0
      expect(subject.deposit(-10)).to eq "You can't deposit a negative amount"
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

    it "should not accept a negative amount" do
      subject.deposit(10)
      expect {subject.withdraw(-10)}.to change {subject.balance}.by 0
      expect(subject.withdraw(-10)).to eq "You can't withdraw a negative amount"
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

  describe "#print_statement" do
    it "should call the print_full method on statement class" do
      expect(statement_class).to receive(:new)
      subject.print_statement
    end
  end

end
