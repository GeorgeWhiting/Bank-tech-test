describe Statement do

  let :transaction_history {double(:transaction_history)}
  let :transaction {double(:transaction, date: "1/1/18", amount: 10)}
  subject {described_class.new(transaction_history)}

  describe "#print_header" do
    it "should print the header out" do
      expect {subject.print_header}.to output("date || amount || balance\n").to_stdout
    end
  end

  describe "#print_transactions" do
    it "should print the transactions body out" do
      allow(transaction_history).to receive(:each).and_yield(transaction)
      expect {subject.print_transactions}.to output("1/1/18 || 10 || 10\n").to_stdout
    end
  end

  describe "#print_full" do
    it "should print the full transactions list out" do
      allow(transaction_history).to receive(:each).and_yield(transaction)
      expect {subject.print_full}.to output(<<~MESSAGE).to_stdout
      date || amount || balance
      1/1/18 || 10 || 10
      MESSAGE
    end
  end
end
