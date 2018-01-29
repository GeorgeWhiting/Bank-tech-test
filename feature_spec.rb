require_relative './lib/user'
require_relative './lib/bank'
require_relative './lib/transaction'
require_relative './lib/statement'

user = User.new("Geg", "123 Street Street")

user.create_bank_account
# p user.create_bank_account

p user.deposit(1000)
p user.withdraw(500)
# p user.get_balance
# p user.withdraw(1000)
# p user.get_balance
# p user.view_transaction_history

statement = Statement.new(user.view_transaction_history)
statement.print_full
