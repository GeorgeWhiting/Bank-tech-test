describe Bank do

  subject {described_class.new}
  let :user {double(:user, name: "Geg", address: "123 Street Street")}

  describe "#balance" do
    it "should return a balance" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#deposit" do
    it "should increase the balance" do
      expect {subject.deposit(10)}.to change {subject.balance}.by 10
    end
  end

  describe "#withdraw" do
    it "should decrease the balance" do
      subject.deposit(10)
      expect {subject.withdraw(5)}.to change {subject.balance}.by -5
    end
  end

end
