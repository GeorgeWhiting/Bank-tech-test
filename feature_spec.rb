require_relative './lib/user'
require_relative './lib/bank'

user = User.new("Geg", "123 Street Street")

p user.create_bank_account
p user.create_bank_account

p user.deposit(1000)
p user.withdraw(500)
p user.get_balance
p user.withdraw(1000)
p user.get_balance
