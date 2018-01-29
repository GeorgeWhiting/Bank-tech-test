require_relative 'transaction'
class Bank

  attr_reader :balance, :transaction_history

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history << @transaction_class.new(Time.new.strftime("%d/%m/%Y"), amount, @balance)
  end

  def withdraw(amount)
    (@balance - amount < 0) ? "You don't have that much money" : (@balance -= amount; @transaction_history << @transaction_class.new(Time.new.strftime("%d/%m/%Y"), -amount, @balance)) 
  end

end
