require_relative './lib/user'
require_relative './lib/bank'
require_relative './lib/transaction'
require_relative './lib/statement'

user = User.new("Geg", "123 Street Street")

user.create_bank_account

user.deposit(10000)
user.withdraw(500)
user.withdraw(5000)
user.deposit(10)

user.bank_account.get_statement.print_full
