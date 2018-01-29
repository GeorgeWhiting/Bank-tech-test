class Bank

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    (@balance - amount < 0) ? "You don't have that much money" : @balance -= amount 
  end

end
