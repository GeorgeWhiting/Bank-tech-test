require_relative 'transaction'
require_relative 'statement'
class Bank

  attr_reader :balance, :transaction_history

  def initialize(transaction_class = Transaction, statement_class = Statement)
    @transaction_class = transaction_class
    @statement_class = statement_class
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    is_positive?(amount) ? (@balance += amount; @transaction_history << new_transaction(amount)) : "You can't deposit a negative amount"
  end

  def withdraw(amount)
    return "You can't withdraw a negative amount" unless is_positive?(amount)
    can_afford?(amount) ? (@balance -= amount; new_transaction(amount)) : "You don't have that much money"
  end

  def print_statement
    @statement_class.new(@transaction_history).print_full
  end

  private

  def can_afford?(amount)
    @balance - amount > 0
  end

  def new_transaction(amount)
    @transaction_class.new(Time.new.strftime("%d/%m/%Y"), amount, @balance)
  end

  def is_positive?(amount)
    amount.positive?
  end

end
