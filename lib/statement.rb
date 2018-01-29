class Statement
  def initialize(transaction_history)
    @transaction_history = transaction_history
  end

  def print_full
    print_header
    print_transactions
  end

  def print_header
    puts "Date " + "|| Credit ".rjust(16) + "|| Debit ".rjust(14) + "|| Balance".rjust(16)
  end

  def print_transactions
    @transaction_history.reverse.each do |transaction|
      puts "#{transaction.date} ||" +
            " £#{'%0.2f' % credit_or_debit(transaction.amount)[0]} ||".rjust(15) +
            " £#{'%0.2f' % credit_or_debit(transaction.amount)[1]} ||".rjust(15) +
            " £#{'%0.2f' % transaction.balance}".rjust(15)
    end
  end

  def credit_or_debit(amount)
    amount.positive? ? [amount, 0] : [0, -amount]
  end
end
