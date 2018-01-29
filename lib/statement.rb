class Statement
  def initialize(transaction_history)
    @transaction_history = transaction_history
  end

  def print_full
    print_header
    print_transactions
  end

  def print_header
    puts "date || credit || debit || balance"
  end

  def print_transactions
    @transaction_history.reverse.each do |transaction|
      puts "#{transaction.date} || #{credit_or_debit(transaction.amount)[0]} || #{credit_or_debit(transaction.amount)[1]} || #{transaction.balance}"
    end
  end

  def credit_or_debit(amount)
    amount.positive? ? [amount, 0] : [0, -amount]
  end

end
