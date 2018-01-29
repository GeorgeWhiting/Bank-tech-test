class Statement
  def initialize(transaction_history)
    @transaction_history = transaction_history
    @balance = 0
  end

  def print_full
    print_header
    print_transactions
  end

  def print_header
    puts "date || amount || balance"
  end

  def print_transactions
    @transaction_history.each do |transaction|
      @balance += transaction.amount
      puts "#{transaction.date} || #{transaction.amount} || #{@balance}"
    end
  end

end
