require_relative './lib/user'
require_relative './lib/bank'

user = User.new("Geg", "123 Street Street")
bank = Bank.new()

user.assign_bank_account(bank)

p user.deposit(1000)
p user.withdraw(500)
p user.get_balance
