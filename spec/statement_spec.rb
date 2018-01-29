describe Statement do

  let :transaction_history {double(:transaction_history)}
  let :transaction {double(:transaction, date: "1/1/18", amount: 10, balance: 10)}
  subject {described_class.new(transaction_history)}

  describe "#print_header" do
    it "should print the header out" do
      expect {subject.print_header}.to output("date || credit || debit || balance\n").to_stdout
    end
  end

  describe "#print_transactions" do
    it "should print the transactions body out" do
      allow(transaction_history).to receive(:each).and_yield(transaction)
      expect {subject.print_transactions}.to output("1/1/18 || 10 || 0 || 10\n").to_stdout
    end
  end

  describe "#print_full" do
    it "should print the full transactions list out" do
      allow(transaction_history).to receive(:each).and_yield(transaction)
      expect {subject.print_full}.to output(<<~MESSAGE).to_stdout
      date || credit || debit || balance
      1/1/18 || 10 || 0 || 10
      MESSAGE
    end
  end

  describe "#credit_or_debit" do
    it "should return a 2 bit array for credit/debit given a +/- amount input" do
      expect(subject.credit_or_debit(10)).to eq [10,0]
      expect(subject.credit_or_debit(-10)).to eq [0, 10]
    end
  end
end
