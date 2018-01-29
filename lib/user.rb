class User

  attr_reader :name, :address
  attr_accessor :bank_account

  def initialize(name, address)
    @name = name
    @address = address
    @bank_account = nil
  end

  def assign_bank_account(bank_account)
    @bank_account = bank_account
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
