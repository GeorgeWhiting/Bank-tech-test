require 'Bank'
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
    @bank_account = @bank_class.new
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


end
