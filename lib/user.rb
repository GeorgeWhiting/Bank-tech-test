require_relative 'bank'
class User

  attr_reader :name, :address
  attr_accessor :bank_account

  def initialize(name, address, bank_class = Bank)
    @name = name
    @address = address
    @bank_class = bank_class
    @bank_account = nil
  end

  def create_bank_account
    @bank_account.nil? ? @bank_account = @bank_class.new : "You already have an account"
  end

  def deposit(amount)
    @bank_account.deposit(amount)
  end

  def withdraw(amount)
    @bank_account.withdraw(amount)
  end

  def get_balance
    @bank_account.balance
  end

  def print_statement
    @bank_account.print_statement
  end

end
